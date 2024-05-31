import platform


def lambda_handler(event, context):
    print("app1.py")
    arch = platform.machine()
    print(f"System is running on {arch}")
    return {"statusCode": 200, "body": f"This system is running on {arch}"}


if __name__ == "__main__":
    lambda_handler({}, {})
