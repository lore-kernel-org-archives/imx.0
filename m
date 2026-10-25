Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792916690;
	b=wjh3CeHWMzrDX9lnhGDawlX/8j0qcEkTUmEoSe2VqvqP/TpYKpqCqYNh+NALy3mlbf0B
	 Shjg+3FbWmWqXhVBDCncjlid1meISSY8GOq7S9NiS+Xz01JKPRn7DXx8siXs6MHeOn4aj
	 G2eybI1pKo1G9wKezFGW9djWXGQyCCsd8NbUCOed+829NI1lATKGq42bqB1uG+5yRqNQG
	 2bIRMdjOd84uLFScsApkP+lGwOQA8vaEGPfC+KZIqnQazGsAVsfoqn4UfYqbYUWBsP0VZ
	 eUO3XjIcz6hV++0gsI8uVLBvIa2Dmtqg2B85Sp552vs8PeJc6pfiEXNaxxi6m+c1cjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792916690;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=7RWPUVAjdb3F1t8/E4Di9FGAQf/lla3oj1eazW4iQLc=;
	b=pWOppm3RGtYVpFxm+piCjzRDa4XnS0IB2ZoAs4ax/oRnxjWATCfqBkpWKZzYi/ijHrUV
	 t9VK34KiuRafvrsLWg27nYOaKGfwrjtnu6nBHc+MdLwt8yeJ4ziUC8ggrjI8NWHJZU0PS
	 7F3FjrSdkJQ4GV7QQ95dwNm0mzCJQXh3rlfrolhtyQFxBqa//RucRHKK2/rBQSbyoWFTD
	 /La2RSnlkUMB4SsmtQTvReiccBrTjhdtCBT/+r9NgQ2Gu7EX0E1SqVlTBGhDUisuFLW+W
	 2ZBEX7TdQXSh/C1N6FpVsiBH58oDnS2IolnwpLwD/LKhl0QD+RkXI4yX0J5OnyxM5LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=D1Mx3zSP;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8652606A31F
	for <imx@lists.linux.dev>; Sun, 25 Oct 2026 08:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8652606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=D1Mx3zSP
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F0F483F131
	for <imx@lists.linux.dev>; Sun, 25 Oct 2026 08:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792916686;
	bh=7RWPUVAjdb3F1t8/E4Di9FGAQf/lla3oj1eazW4iQLc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=D1Mx3zSPvqL+TX+7jPag7RYNyMUM0k3doAUyLJC0CiaNYZ7855ipsmotb1pBkfzjY
	 ZeVNk+ZHdfJhgSW4RTfMB2qnwUe3sNOMGV5PGOd3/MnkcGUI4cHhBq724TIgrpNV2I
	 p//JRJVPEANZ3v+QWCYKsiJ78QYfDbzMB52k4OaSRHOXI3J0CmuGYWs9oD4ue+mJ9R
	 M6saVe9d2aey2jEgM7g/uKAGegvoqNo1fYYDXH3vvgoGicMJz4KcZJaUB33cDd4TaN
	 Oav4fGFRmqghR68vZgjIDfmrUkvSmq4GfaEz0Y7FSbcEFBl4t9XDRFGkBzbUIjgW7U
	 DeihuRop6hVmV0ublJD0BnLH0ocMOwhnO3dslfua+LZ1RY+c8sOI6zliKxgCb/N/DV
	 MoNUkwE/HJOfT2ON3hHwUDAhDpsP95x//amFZikkc4dLf/PSQEywAzpRzYehgds5kD
	 8g18kFOXbtmA6FPC2uilCWUNO3siNN/HzmlCDy9VcRVmvf0bkGtCzuQKP+OXNTKteb
	 4ThIRsytT8hTTh9tdE9Le8o/64NMtrDM8sAzi/inwNbGl6i+WsN3FGe4DIEjCFz0xd
	 OC7yedH2DdcgPIcwQ9/T6IhAsfmEAliADNmbYWDRMQsQ5w0rJJuAbMzCW8VixSuQDA
	 1r42nh/GX+27T5PqQ2XWQZN4=
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3662e7a9299so10737609eec.1
        for <imx@lists.linux.dev>; Sun, 25 Oct 2026 01:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792916684; x=1793521484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RWPUVAjdb3F1t8/E4Di9FGAQf/lla3oj1eazW4iQLc=;
        b=OaYztBJlbcchyd10f4u8cWcWwLYGcRNG+5Tvy1L0fVb7rSpFW6xKwtjsi3WSKBerm2
         87K4ZLGUQOHfIFIUK2qZ9YbKxoPmmZCynt5VyV41QHZDnwa4+zdmOY/EdVdXaPeYM6Bc
         b9gY0Ma9jRiTxetUdpF6ahJmlZDKQPf2zppB12gwn/y27b2DLkHNn7bligIiqEbZMcME
         PX/jfjx+K+GWz8XuwRfoXR8pDIYJZJ2w/dAQEFOvSS6QXY/s9myoKYcVOSnx71McXWLX
         x5Fe28mwkj5yOmUNqQYhZ4rKANrEGQwY2F6KWqWGKA/bqTIZRKHQW4TGurn0qy2PEiqW
         10fw==
X-Forwarded-Encrypted: i=1; AKwUvBypfZ81sfZlNn1xon7nsA3926ISrBe+lAmBiIJFenrrIR9nhr78EqYL/Q8KDjt4DahvI98=@lists.linux.dev
X-Gm-Message-State: AFq9FYKzioizAS7Lb9QYG94g2EBXzK3HyUrjUp3pbC3k+NS67Wpozasp
	8XdxD2OtHT1Y0HUE0Z2rq5F/oDSPksoMaBEVrG/O/FJHXPUxv2A9+3U+E2/G5qvd5lYoCpvdxOw
	rVMk+ZqNzp2CJGXuPZVEP5tt2isW0UhngF3a32LzUkhmhWly5RDmbkJzBUBGkOKycCaQw4Q==
X-Gm-Gg: AYBFou0kGLJEHv3jiSVoCm8tpP3DzyTQkILoh23d6UkKd4+6ekInh4QA79Rq7LmhUAg
	4MPrILyRg55xy5QYR47z+Yj2K7GbHLW282gFFssEcXLLsPR1zMB9arlQYmfmQoiFTgvVDgbwCDO
	BUv109U3dD8GXkmiE1RY4gSgvWTB/He0xAg6WBGVV6Oq2Zfn95sc+mzvYwwPMuU8zmqvNov1s0w
	FN9pjaYhfyVdXYaA0kzvw1ifkVvtoee803otLBX/iaRkPmAjVczVt5Zzhg5UNwVo9h0ua1ZIqlv
	Wo3aIGYbpFac4fx5dxkVrjQt/PT3kqAJdtOdJOvJ+4PnUDzHkrbaOnsQCa3HNfCX3DiuBoB/mMn
	AqDxDNVex0WfhBl2C1vgVoqSNtLXCzXPR4EaapxKXRrNfwg6gZAxkCwos9FJtRnGx41vywuw=
X-Received: by 2002:a05:7301:f2b:b0:35d:f3cb:ede with SMTP id 5a478bee46e88-369e836aeeamr5907901eec.5.1792916683841;
        Sun, 25 Oct 2026 01:24:43 -0700 (PDT)
X-Received: by 2002:a05:7301:f2b:b0:35d:f3cb:ede with SMTP id 5a478bee46e88-369e836aeeamr5907869eec.5.1792916683321;
        Sun, 25 Oct 2026 01:24:43 -0700 (PDT)
Received: from resolute-linux.tail872496.ts.net (211-75-139-218.hinet-ip.hinet.net. [211.75.139.218])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f27d5bf8sm10301143eec.4.2026.10.25.01.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 01:24:42 -0700 (PDT)
From: Aristo Chen <aristo.chen@canonical.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aristo Chen <aristo.chen@canonical.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: nxp: imx8-isi: Register the media device only once
Date: Sun, 25 Oct 2026 08:24:18 +0000
Message-ID: <20261025082419.199021-1-aristo.chen@canonical.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2-async framework calls the notifier .complete() operation every
time the last missing subdev gets bound. This happens again each time a
remote subdev is unbound and bound again, for instance when the sensor
driver is unbound and rebound through sysfs.

mxc_isi_async_notifier_complete() calls media_device_register()
unconditionally. Each call allocates and registers a new media devnode
and overwrites mdev->devnode, so every rebind creates an additional
/dev/mediaN for the same media device, and leaks the previous devnode
and its minor number. As media_device_unregister() only unregisters
the most recent devnode, the older ones also stay registered after the
ISI is removed, and ioctls on them dereference the freed media_device.

On an i.MX93 board with an AP1302 ISP, every unbind/bind cycle of the
AP1302 driver adds one /dev/mediaN: after three binds, /dev/media0,
/dev/media1 and /dev/media2 all expose the same media graph.

Register the media device only if it isn't registered yet. Keep the
v4l2_device_register_subdev_nodes() call unconditional, as it has to
create the device nodes of the rebound subdevs, and it already skips
the subdevs that have one.

The issue was found while debugging an unbind crash in the AP1302
driver of the NXP BSP kernel. An AI coding assistant helped to find
it, and wrote this fix and its changelog.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Aristo Chen <aristo.chen@canonical.com>
---
Tested on an i.MX93 FRDM board running the NXP BSP kernel
(lf-6.18.20-2.0.0), whose mxc_isi_async_notifier_complete() is identical
to mainline, with the AP1302 driver from the same BSP plus a local fix
that makes it possible to unbind it:

- Without this patch, three unbind/bind cycles of the AP1302 driver
  left /dev/media0, /dev/media1 and /dev/media2.
- With this patch, after each of three unbind/bind cycles only
  /dev/media0 exists, and media-ctl -p on it shows the rebound AP1302
  and sensor entities. No kernel warnings.

Not tested: the ISI removal path, where the stale devnodes would be
dereferenced. Build-tested on top of 330517c63aa9 with W=1, no new
warnings; sparse was not run.

 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 0ae5f35e017c..82a03742405d 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -90,6 +90,10 @@ static int mxc_isi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 		return ret;
 	}
 
+	/* .complete() is called again every time a subdev gets rebound. */
+	if (media_devnode_is_registered(isi->media_dev.devnode))
+		return 0;
+
 	return media_device_register(&isi->media_dev);
 }
 

base-commit: 330517c63aa9b48227b6ab45f01003effac77ae4
-- 
2.53.0

