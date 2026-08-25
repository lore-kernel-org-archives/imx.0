Received: from mail-m49224.qiye.163.com (mail-m49224.qiye.163.com [45.254.49.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4BA3F6619
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 11:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787656717; cv=none; b=EBdh6oUEosWsX3Ehj3ZVvRIYihq9isvxgedS4fYt+yaIDdaqvRMkpU5O8ea0fhO+g7FW+9UFU2Y0msVSqj2brDCjzL0AhDCjEgUduvn//42AfoFYTbqslzCtnSCLoMWEUUpH0NXTfDuyReN0BTuQm7vRVaShMiqGrptQIkybJZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787656717; c=relaxed/simple;
	bh=UlgNgsoI2mgmcPjZD9IEaM7dJdoYRpuKMNwGpLxOlJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aNxZ+43514i1IskgyucOekH5u41Wt0/zfah31amAyKFoBnNRLqjPvLPznSFAQfiqlEm8sFyYdk5gJi7i43PQebO7es/xJ04ICoc9FXMZuDNkZDvhH3Q5cgDs5J4WS9rea7tsaKXTDxdMrmhCc7yns8mPGpdaDQOET6Hj3ou8Rgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=g6sSXvDm; arc=none smtp.client-ip=45.254.49.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="g6sSXvDm"
Received: from tsdl-HP-EliteDesk-880-G6-Tower-PC.. (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4b42473f7;
	Tue, 25 Aug 2026 19:13:14 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: Frank.Li@nxp.com,
	andersson@kernel.org,
	bryan.odonoghue@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	festevam@gmail.com,
	hongyang.zhao@thundersoft.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	rosh@debian.org,
	s.hauer@pengutronix.de
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219 camera overlays
Date: Tue, 25 Aug 2026 19:13:00 +0800
Message-ID: <20260825111300.578054-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1ef41a49-dcf8-4252-acdd-f7f3c1210c55@oss.qualcomm.com>
References: <1ef41a49-dcf8-4252-acdd-f7f3c1210c55@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0389fd69e09d5kunmfc72ad39516699
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQksdVkhNSkJKTklNT0MeSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG
DKIM-Signature: a=rsa-sha256;
	b=g6sSXvDmyQWkNKsuejnsoucOf08FtjSwsRNkWjRVUoH/E29b1E0J9z8qeSrVwN809tPpS8Ilc0BD+F/R7/QBNEetBJKtHhWfzAyZyZSq2UVy8DqjM5ZjQyY7oJMoNXKLyV9aXvejDAWSEkdToPQ2lF1y4Bqdk+hw7aVITxyVexs=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=vu2NX5WQU7lXnOIBq1D5RPPESP5Qndpwyx9mUpie3Rk=;
	h=date:mime-version:subject:message-id:from;

Hi Konrad,

Thanks for the review.

On 8/12/26 4:22 AM, Hongyang Zhao wrote:
> > RUBIK Pi 3 ships without camera sensors, and its two connectors support
> > multiple modules. Keep module-specific nodes out of the base board DTS
> > and add per-connector overlays for Raspberry Pi Camera Module V2 IMX219
> > sensors.
> > 
> > CAM1 uses CCI1 and CSIPHY1, while CAM2 uses CCI0 and CSIPHY4. Each
> > overlay describes the 24 MHz sensor input clock and models the module
> > power domain controlled through the connector PWR_EN signal. The
> > baseboard supplies VCC3V3_OUTPUT separately and has no per-camera
> > regulator.
> > 
> > Describe each connector CAMERA_GPIO signal as a privacy indicator LED
> > and associate it with the corresponding sensor. This lets the V4L2 core
> > control the LED while the sensor is streaming.
> > 
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > ---
> 
> [...]
> 
> > +	camera@10 {
> > +		compatible = "sony,imx219";
> > +		reg = <0x10>;
> > +
> > +		clocks = <&cam1_imx219_clk>;
> > +
> > +		VANA-supply = <&vreg_cam1_pwr>;
> > +		VDIG-supply = <&vreg_cam1_pwr>;
> > +		VDDL-supply = <&vreg_cam1_pwr>;
> > +
> > +		leds = <&cam1_privacy_led>;
> > +		led-names = "privacy";
> 
> No reset GPIOs?

Yes. The RubikPi camera connector does not route a dedicated sensor reset
signal. It exposes PWR_EN and CAMERA_GPIO, but neither is connected
directly to the IMX219 reset input when using the official Raspberry Pi
Camera Module 2.

PWR_EN is connected to the module's ENABLE signal and controls the
module-local power supplies. CAMERA_GPIO corresponds to a pin that is
not connected on Camera Module 2. The IMX219 /PWDN signal remains local
to the camera module and is tied to its 1.8 V rail.

Therefore, there is no board-controllable reset GPIO to describe for
this camera configuration.

> 
> You should also have a reference to the mclk pin state to make sure
> the correct pin function kicks in

The Camera Module 2 provides its own 24 MHz oscillator, which is
connected to the IMX219 MCLK input on the module. RubikPi does not route
a SoC CAM_MCLK signal to this connector. The fixed-clock node represents
that module-local oscillator, so there is no corresponding TLMM MCLK
pin state.

The Camera Module 2 schematic shows both connections:
https://datasheets.raspberrypi.com/camera/camera-module-2-schematics.pdf

RUBIK Pi 3 schematic (CSI connector, page 13):
https://thundercomm.s3-accelerate.amazonaws.com/uploads/web/rubik-pi-3/RUBIKPI3-IOB-V02-RELEASE.pdf

Best regards,
Hongyang
