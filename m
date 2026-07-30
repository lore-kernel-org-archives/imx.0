Received: from mail-m15588.qiye.163.com (mail-m15588.qiye.163.com [101.71.155.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610DB3B14D7
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 07:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785395283; cv=none; b=p4IJz5E0Kl3cRjI5wweHrswfF4CHwwQqwabfdCzTB4olXL7Z1bJOsA2u8MTocE+TNGb6FswWePU26oiN3KoDzjzK4QDPIrb89x3TpxiCxOwO2JQ1ze/esQy7tpwWa3+CCv6ZCkNzlCnTJR4S/qTd9+ba61cB1D+uSrbItWm1gvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785395283; c=relaxed/simple;
	bh=4Dl/vEDT9nrWPbJYDdBCfyanjVblmsxSZ1oBxI8vlsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j8VbaeoLQc3gkfsKcX9OrNYHl/Zvdr6u4VRDdUXuEsnxft8d03+PlvhzrUnEvmaNllrmJlRJNqQQv9GFu4M9zDhjB1iryapKj0OEL2ODta3ryYuQ1ESice6GNGlnsSWQhS/8vhu2LvzWW/vQLrpcpRh2dyZ/ZbGvKHaoCmLTy3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=lUVes6gp; arc=none smtp.client-ip=101.71.155.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="lUVes6gp"
Received: from tsdl-HP-EliteDesk-880-G6-Tower-PC.. (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 48229bf3b;
	Thu, 30 Jul 2026 14:32:22 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: Frank.Li@nxp.com,
	andersson@kernel.org,
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
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219 camera overlays
Date: Thu, 30 Jul 2026 14:32:09 +0800
Message-ID: <20260730063209.101985-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <df03eb18-6928-453e-971b-681875e9cb0d@oss.qualcomm.com>
References: <df03eb18-6928-453e-971b-681875e9cb0d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fb1b95bc609d5kunm33851e72421b63
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSU5PVh0YHk1KSBlMTBpOSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG
DKIM-Signature: a=rsa-sha256;
	b=lUVes6gpRtPahu70dav9JcaPDiXD8qCqZEDGGd7mIF6iazNQSF2SLuWFhbFiC5Qm0Ryx+45wRAaCgxbLQeOjxf0u/LIB/JhU7IB3+PQfWNBoW7W8c4w9AIa51hpdJaGWdMNlkKAFgjbdY69mrPNJCOvIuUwizcDTV59s0mrNGPk=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=TeZJfMeEBUKgq5/BN6M8K1O5LEECpi0aBZRRrkDbOj0=;
	h=date:mime-version:subject:message-id:from;

Thanks for the review!

On 7/22/26 6:12 PM, Hongyang Zhao wrote:
> > RUBIK Pi 3 ships without camera sensors, and its two connectors support
> > multiple modules. Keep module-specific nodes out of the base board DTS
> > and add per-connector overlays for Raspberry Pi Camera Module V2 IMX219
> > sensors.
> >
> > CAM1 uses CCI1 and CSIPHY1, while CAM2 uses CCI0 and CSIPHY4. Each
> > overlay describes the 24 MHz sensor input clock and the three sensor
> > rails derived from the switched 3.3 V connector supply.
> >
> > Describe each connector CAMERA_GPIO signal as a privacy indicator LED
> > and associate it with the corresponding sensor. This lets the V4L2 core
> > control the LED while the sensor is streaming.
> >
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > ---
>
> [...]
>
> > +	/* The module enables its three sensor rails together through PWR_EN. */
> > +	vreg_cam2_pwr: regulator-camera2-pwr {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "vreg_camera2_pwr";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;
>
> Is this (and the other) regulator on the SBC, or on the module (with
> the PWR_EN pin just being an output to the module connector)?

The per-camera power regulation is located on the camera module, not on
the baseboard. The board-level VCC3V3_OUTPUT rail supplies both the
40-pin header and the two camera connectors. On the baseboard, U1500
only level-shifts the PWR_EN signals before routing them to the camera
connectors; there is no dedicated per-camera regulator.

The fixed-regulator node in the module-specific Device Tree overlay
models the camera module's power domain controlled through the
connector's PWR_EN signal.

Hardware Schematic:
https://thundercomm.s3-accelerate.amazonaws.com/uploads/web/rubik-pi-3/RUBIKPI3-IOB-V02-RELEASE.pdf

Thanks,
Hongyang
