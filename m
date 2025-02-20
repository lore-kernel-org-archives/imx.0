Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151E2214210
	for <imx@lists.linux.dev>; Thu, 20 Feb 2025 23:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740092907; cv=none; b=NS92UTPT8WTa1DQl3FwWr3HsWECw5hw+akTOFNtLvOfg+GbnvKlegpJ+XSCH9g0finbqdyO0pi5eWhBsNcHbCfOarHkPfuut+CTiiox56z5XEGPJGw91TJnaeVmkfErL+j5z4ONu78bEdKIJehGa6u0DEBlDpM6yI2Bw4VLgEsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740092907; c=relaxed/simple;
	bh=pl+/7EWG3hPE+Epp1RScVgVLKto/qJ+PZdiT/igveD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JE9nSvhCpKkluUeuVxHvd0NsCiDN22/II2gGIqwV2dAV0lQdIN279btj4OxNXDsKnHEpMROjkhq5xeedY0+IYkodAJY6LLSua+f/OHEGVWJM+q2XFDYFnCLfHujqrThaip24/8wBOPuneNPYNv2ZCIRCraf1Ovj3UFUkViTNqSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OswJnCCx; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OswJnCCx"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso266999266b.1
        for <imx@lists.linux.dev>; Thu, 20 Feb 2025 15:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740092904; x=1740697704; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vgLCVi2eqi2umimuqd7r8m9jVOLKYJ0bYbbWZhjQWDg=;
        b=OswJnCCxClzLptXNZJjaCVc4gFZselVWZlqBN3U2fHS49/n7/pnMMzu/ZYB/csKCtK
         NJvJ4tRlrJFC1nY9HdKgnlWWVvC3iNurKuDYTuc3UC07D8wYOWuboZeoMdt8R77tW+iu
         Vaz6SCLWuzRf2lPf+kqYsVvo1kzym2cAT5i3krXGbDBsPrEzC1DvMASJ2/s3twRTb5lA
         nLKoV+eMNMnLFZDwRzTzz8QDJlf0de6blIrxG61qpp5Qrvg4vnanc89Idd5pAZdgEPBb
         afN3eOIKnwBG398KZ05vprBMxQi3mx27ft+F6rOgn8CYNvFf7/g0747R7bQqxOnZ9u0n
         IfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740092904; x=1740697704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgLCVi2eqi2umimuqd7r8m9jVOLKYJ0bYbbWZhjQWDg=;
        b=sqvI0QV2+xZscFIFt3XzdjiH3KneKrRlBXPOwP701TBueaixaDN6TvsSKxWD4QnXeb
         sKH0Rdm1Z7/KTk/9KbW3zDufxO4SqYd/AD5Kl22AmAVZwSmijftTmGJk933IWNS4cN+V
         /bFtITEAqZQDqi3KZuxFmlJ4wdfK7+fX59BFqwASA0eD+6KHort/44HzDBS1vUY1CL+T
         2xO9JA99hRYq55XLibd6NvWRCtolGMtGMttV05OL/MKarBjPV1MJMEr66dCJKIly1QRu
         ljRv1fLhgn/SWdoNS7M6boaDkqYHRogjTgQk2xX/I+nzpqqbZLCN7jl/9OqU7ikANEao
         JnOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeLED0KUrIFTgjhiyOhVXcQmwu9TeiS4sE0zn7HSxEIiEG5fRYsZfJzjbjUDvDrjRrw1c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzv3kRZta/mS1mOht7EIP6+62p7p9Kyb771lC7xL3pX3G82tz4/
	oTkExkcpMOLQOZ8yMkxA2poTWYGgXGpJVC72XQhEcRGDBcJW3UlA
X-Gm-Gg: ASbGncvPnrFQc0WPBkJa4fxBIeWv89wiMNpoFjY9k5Dhg/9Se1Kxfwtx/eT3IhVc7zG
	pgiA73Z1NPtqgZ/MnTBzAHrfA9HoGCR+pZRHuUOwPXgbHPh2cqhxNuyoKwyqgglx518pSyjk0kh
	7alLNnSE1hdam6Jb5qEEOcsuNg8zcSvgBgmC1Ca7a5+iw4r4LX9/6pt3TCkPybevR3vYMuPBjHg
	lnnFb75+giuPSOGYS4Sx2i2J6HYDB2slwRiCwuRdf1bkfoMgxpw2yZdl9OOHTHYBR+z/g6tsY10
	6xLm3Fz0O51tPJyIpsp/NTGmivKz
X-Google-Smtp-Source: AGHT+IEDvxSma402XTJDmRJ/JuNvt76UQM64+7z10txDsXDLl3qf7Mk9kk+qny/wDvwm+o3bDkamYw==
X-Received: by 2002:a17:906:3293:b0:abb:cdca:1c08 with SMTP id a640c23a62f3a-abc09a0bfcfmr94355266b.16.1740092904163;
        Thu, 20 Feb 2025 15:08:24 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9654a6b2sm909107066b.135.2025.02.20.15.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 15:08:23 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v2 0/6] media: v4l: add support for Virtual Channel IDs
Date: Fri, 21 Feb 2025 01:08:08 +0200
Message-ID: <20250220230818.275262-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Multi-camera systems often have issues with receiving video streams
from multiple cameras at the same time because the cameras use the same
Virtual Channel IDs.

CSI bridges might not support remapping the Virtual Channel IDs, making
it impossible to receive the separate video streams at the same
time, while the CSI receiver is able to de-mux streams based on VC IDs.

Cameras sometimes have support for changing the VC IDs they output
themselves.

For a practical example, GMSL2 deserializer chips do not support VC ID
remapping in tunnel mode, and neither do the serializers. Allowing the
cameras to have their VC IDs configured would allow multi-camera setups
to use tunnel mode.

Add support for specifying these Virtual Channel IDs in Video Interface
Endpoints.

Add support for parsing VC IDs in v4l2_fwnode_endpoint_parse().
This allows us to retrieve the specified VC IDs in camera drivers and
configure the hardware to use them.

The supported values are 0 to 3, with a maximum of 4 values.
Although the CSI-2 specification allows for up to 32 virtual channels,
most hardware doesn't support more than 4. This can be extended later
if need be.

The driver must validate the number of VC IDs and the VC IDs
themselves.

Add an example implementation for IMX219.

V2:
 * goto err_rpm_put on failure to configure VC ID in imx219, and print
   error

Cosmin Tanislav (5):
  dt-bindings: media: video-interfaces: add support for Virtual Channel
    IDs
  media: v4l: fwnode: parse Virtual Channel IDs for CSI2 buses
  dt-bindings: media: imx219: add support for Virtual Channel IDs
  media: i2c: imx219: pass format's code to imx219_get_format_bpp()
  media: i2c: imx219: implement configurable VC ID

Laurent Pinchart (1):
  media: i2c: imx219: Report streams using frame descriptors

 .../devicetree/bindings/media/i2c/imx219.yaml |  2 +
 .../bindings/media/video-interfaces.yaml      | 11 ++++
 drivers/media/i2c/imx219.c                    | 56 ++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-fwnode.c         | 15 +++++
 include/media/v4l2-mediabus.h                 |  5 ++
 5 files changed, 86 insertions(+), 3 deletions(-)

-- 
2.48.1

