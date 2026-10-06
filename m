Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D73326C385
	for <imx@lists.linux.dev>; Tue,  6 Oct 2026 06:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791269536; cv=none; b=JhTyENlJq3L7XGFSyi0m5eHIobW6ImYOsmDOP71LzxtH479IWZ4ObUmad7NsKLVNFiTghBv8nWeK784qhYEhTIQ4qXPcLohWkoc4OFgsSOkeR+IuMVM0viGz5rXTuJMj8UFysy2RHXPBetRdtdF1ORh6z3WUNlSmzAwfXVkdADg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791269536; c=relaxed/simple;
	bh=sXEuhuPbydIc2hl07e1Bu/OzsVyrxTFy5iWRYniIZCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ivLKbBKZZFIm9anitsM92M61rIfNlbS+dGfma1igQyJKiJESNUimq6pyXmnBVCjCF9Tv7pzaBQ15eFYimPNvLSCkVwjjQu+RjbqZwepIneLqC5E/fJJGbzGSVv/lVCPVXUpS6RNVDhDBYmhy13NTwsL0Jm3OhUANMoDzUmAlKeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLdrmjJL; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLdrmjJL"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so7217838eec.1
        for <imx@lists.linux.dev>; Mon, 05 Oct 2026 23:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791269533; x=1791874333; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZzqvAx4iFT6Nq0wHCIP+vtsVoXt5n1py2cHhYmK9d5E=;
        b=LLdrmjJLgE/MPj8uIpIRzalKKm88TnZQokPYC63h/OgIJ7a8TrRcC3j3aF9LzOmEIA
         6VR2EoiSsfwrMQrlIV3OXVPHWvEkDdQ/hxqjGrcormrlkqSDhzgjJrllfTI001a8dxmp
         dLD2NC3Gn76F740jHjfXpNof0QldG1t6292dqycF6QMD4Bs5WAxg3PjELRKz1TjvZGZr
         lWO+3q40p16Q0+Q1j24zR3feYb5mZvCkjF5sqREKKc/cLq+FFV7Hpl7UEo8BWoVJfg1T
         vO1psurvNXLxhwjH6nWorMjTunbVi9KYiDMwW7nq21F2lR+Tn4c695nAIlGsHO/TIsbW
         3uMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791269533; x=1791874333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZzqvAx4iFT6Nq0wHCIP+vtsVoXt5n1py2cHhYmK9d5E=;
        b=KyykBM7mhanlKNVibUMIWFmc4AuWrAvwYfkStyMEr8i6Xcj2fAJKAuphW/L+gH9jy9
         c58nnw647hH6qJ+QrgQKoWocM5cDi17SPAu8br0Tisog12xNNHyCbFTGl9DPqrqaht5s
         fD2t9ErkID2xlydfZTltXwFgW9JT9Ymc71wH7guGdMvVHRUl9uQ2whw14JsBVMgVC/x+
         5ZQb248gFO1k1ta6AOD/VjyGkoRFq20+vBgOSNLKp3SBXUhg+r1u0VhIRySl/sx9xMQ8
         XDgzazU/TiBOI+PijsR9eqzcVNTizDzcxJsIBtsb/FZt5r+aNUmEpunbd7HZMpPGft2K
         mOFA==
X-Forwarded-Encrypted: i=1; AKwUvBw8IkacaI3tgZdVkZlyRZgG8Hi/Vj3dBdThpkpNvKUF0Pt6HzdUo0vUD6w4c3WuvD0ZVTQ=@lists.linux.dev
X-Gm-Message-State: AFuF++l6lRdT+q2oIx/XEN5O8LABqM7XaQNwsnTixptt4YmPOk7I3aBP
	59nS7/P+SdDGJir4D9ntGjToI7O5GTyDORG0+X3zKgTSJlraAV/JvbDI
X-Gm-Gg: AYBFou3nskKFRwHDa4U8CRjadcR2cfFGlcLhJq9vAF9tkxj6Axb7LZRVLNP8CksdYJ1
	nYwk8sWkmqbORunhtiTnHhAq843NuBjabAcYc8+GnXFhTEqHg8vhjUAZ0Y+yTzuAjdZ4pa0DMXy
	xn9vD8sf/90rrFd3iTmw/VwvaFIKB40Shq641oeI4JkDVdhFjQ2sddPahXE7rMTprJ3ftLOY9xe
	DacLtzqCmK9ejILQv9JfNfOflkZFqnGKUPCsnABvfPSx8csh/+xJHtrSQwWfhsSVN1moAhHwWds
	ThZ7uM/XWtHp6UjpfVDvpmKCZveYwAeGqaoBLPUYT6YD3Z1YeeOaB/pdY6sq4rBMQWW+MREa3sk
	jMXf/lmY0FRPr+hMShYg/Z4nbSTtlbG0azgw58krwMWe8tMJmd2HSM7iNA4b6XRIB7sisx0FWdS
	WFQNv0AadVEBaXKtc7bxjsDHMwC5eB2Kp0IKGOoCC7fizBY84B62F+2v1/UJQO5w==
X-Received: by 2002:a05:693c:20c8:10b0:351:4bff:6d6b with SMTP id 5a478bee46e88-3514bff6e22mr859281eec.16.1791269533292;
        Mon, 05 Oct 2026 23:52:13 -0700 (PDT)
Received: from gmail.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351468b2cfasm6306463eec.2.2026.10.05.23.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:52:13 -0700 (PDT)
From: pdsj2807@gmail.com
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de
Cc: Frank.Li@nxp.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palak Raval <pdsj2807@gmail.com>
Subject: [PATCH] staging: media: imx: fix function call formatting
Date: Tue,  6 Oct 2026 12:22:00 +0530
Message-ID: <20261006065203.3645059-1-pdsj2807@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Palak Raval <pdsj2807@gmail.com>

Move the first argument of IMX_BUS_FMTS() to the same line as the
opening parenthesis to address the checkpatch warning.

Signed-off-by: Palak Raval <pdsj2807@gmail.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index f119477cac6b..978770cf3907 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -16,8 +16,7 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 	/*** YUV formats start here ***/
 	{
 		.fourcc	= V4L2_PIX_FMT_UYVY,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_UYVY8_2X8,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_UYVY8_2X8,
 			MEDIA_BUS_FMT_UYVY8_1X16
 		),
 		.cs     = IPUV3_COLORSPACE_YUV,
-- 
2.43.0

