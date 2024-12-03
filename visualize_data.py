import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
import os
from diffusion_policy.dataset.pusht_image_dataset import PushTImageDataset

# Path to your Zarr dataset
zarr_path = os.path.expanduser('~/diffusion_policy_ws/src/diffusion_policy/data/pusht/pusht_cchi_v7_replay.zarr')

# Initialize the dataset
dataset = PushTImageDataset(
    zarr_path=zarr_path,
    horizon=16
)

# Function to visualize all frames of a single sample as an animation
def visualize_frames(dataset, num_samples):
    """
    Visualizes all temporal frames of a single sample as an animation.
    """

    # Collect samples
    samples = [dataset[i] for i in range(num_samples)]
    num_frames_per_sample = samples[0]['obs']['image'].shape[0]
    total_frames = num_frames_per_sample * num_samples

    # Create a figure
    fig, ax = plt.subplots()

    # Turn off axes
    ax.axis("off")

    # Initialize with the first frame
    img_display = ax.imshow(samples[0]['obs']['image'][0].numpy().transpose(1, 2, 0))

    # # Initialize the agent position point
    # point = ax.plot([], [], 'ro', markersize=50)

    # Initialize the title
    title = ax.set_title(f"Sample 1/Frame 1")

    # Function to update the frame
    def update(global_frame_idx):
        sample_idx = global_frame_idx // num_frames_per_sample
        frame_idx = global_frame_idx % num_frames_per_sample

        # Access the current sample and frame
        sample = samples[sample_idx]
        image_data = sample['obs']['image']
        # agent_pos = sample['obs']['agent_pos']

        # Update the image
        # Convert (C, H, W) to (H, W, C)
        img = image_data[frame_idx].numpy().transpose(1, 2, 0)  
        # Update the image display
        img_display.set_array(img)  

        # # Update the agent position
        # x, y = agent_pos[frame_idx].numpy()
        # point.set_data(x*96/255, y*96/255)

        # Update the title
        title.set_text(f"Sample {sample_idx + 1}/{num_samples}, Frame {frame_idx + 1}/{num_frames_per_sample}")
        return [img_display, title]

    # Create the animation
    anim = FuncAnimation(
        fig,
        update,
        frames=total_frames,
        interval=200,  # Frame interval in milliseconds
        blit=False  # Disable blitting for reliable updates
    )

    # Display the animation
    plt.show()

# Visualize the first sample
visualize_frames(dataset, 10)
