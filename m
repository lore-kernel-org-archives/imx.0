Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D3E1FAC4A
	for <imx@lists.linux.dev>; Thu, 20 Feb 2025 14:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061069; cv=none; b=KodDeoLFIn6b+OBZRrz4JSdchhzVbOpf6VA53zp7a+DevJ4/qDx+x7UZrpEGVdflhA88DhiaFDcyWN22G9p+ihh84C7ekJ8mkFEeeixmSy5jGO0cihgqTcoGHinPZZNnsnwt0VkJnpT/qSZx4Wos7StcuqC0rKDrknlhmFu4wQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061069; c=relaxed/simple;
	bh=LUMgRUpWvuZjoguWpdCmke5vgOR7WB4z9bLKqjwwGy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U5+6i5BEWkV1vCMPeL2WeM1R10+Q9MLBg+SJFt8/I0ZMFRoI20+G6mpOWk3ErYvRtVMEa6zk+vckUpu217sSyIasEzaWq6l75DGfTYe2niRPOrqQzIR033Cbg/tRfnsTrQIa4OVjzgIOMO90LGkpJDO+PrhfXz64IxgxE8HGs6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGRjL8Az; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGRjL8Az"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e08064b4ddso1381696a12.1
        for <imx@lists.linux.dev>; Thu, 20 Feb 2025 06:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740061065; x=1740665865; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j5NAA4XF+E1i12VZp9/nJoaJNV9QI4nVe2Rlxr+bSvU=;
        b=PGRjL8AzYt2m8OZjp5/wHSMoZJ2grCJ/hvDPJOUYNNB7TBc/7NIWQFMcm260aqYrr6
         kviLL0/cqPqS5/yQAAcyP3e4NFB3y2zQv8kcKutaNZrW4Ux8rpp+8sdE+0+Kx5KEh7DB
         uQvNkm5KwD1cHckBxYiJc2uRt290RVifad0z+SHKhbcZc0u3TpXY9cyGYKJciEqA3ttX
         SZK+qVCy6IASBXWnFeQKAuGjQK9awVIlIhC6jH1uKzZmOAVFItBWbwe4L+nIo/uaN9Ab
         JPMWgkFnyUng1wTlmeiO3jkrwP9heqTbgLpy02YKH3JqJ5P1HMafNXE87+wWPBQbxczk
         fH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740061065; x=1740665865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5NAA4XF+E1i12VZp9/nJoaJNV9QI4nVe2Rlxr+bSvU=;
        b=gMfQn3Os0c2/vnv4RRvyIkvGRkyYRCMznLw8iIehmV8kczDTfxQsD9zgzqRaPo1Jnd
         VSPfdhQh0v97uBAt3fMLjg4ivNThNVnAh6JW7ow0bRUm6rN8brqW4INqz0M3iWBp5DVm
         AvQHDuo36v98RDJPQroGmXuDzWVhv8b6xsfm39bsoQmvhRZTuu4biEii0TpiTejMMGkc
         JG1xGWn5jkHnGI9DY6CiDO6t+7SVMp/ljftE3eMvTZqoQMHoDEAUX/793S9RcExdE/Qa
         y7un9zT0+gW071vW6onQRhb+QnDjDEWNiaN8eMFoCn2blbRj7PQuOBTRBh5SJL3hWHtt
         OgGA==
X-Forwarded-Encrypted: i=1; AJvYcCWMyR8cCjprv0IP+/VjbXIOfOvCxqkI7++gr0sac1bFCaniLMns3XDeiJa3aPjBU53P+5Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzrAxbnAB8VS1ub/RCm3yzeEEVKL6SGcANSSs0aOe8Cs3pM1vBb
	8sjOC5GG1cRx8yA/7Td5ohfW/MfAeHvW2s6p/IocMO7ea88KT8F5
X-Gm-Gg: ASbGnctlCZumYvftePAQOeye4kCYFYeLKNRBYsh1yboLHP7kHux5Z6AuAaNucwQh6rq
	MbtlkWPl3XZ9m4u4GlVoIr366bTj+5NV3FT1xWBmLq/qp4zvjW/fniFObxTm4WGLU7G5euFwlkX
	cowsfkKIbS3IJiMVhZRO23k2EN5/dU0sp9m7c9PpSH/2kWwh3Ycs+4fXU7agAdXWOWaArbSkukL
	QFzX8kGQds3XyvSbbCJD4OrZ1bIiccQjV7Vp3cN92VRYSESbvGL7NYHdbC/aaPRJREFp+jp+Lhg
	DBBfVulA8NM1JcTw6kETDWKS8Cab
X-Google-Smtp-Source: AGHT+IHwF/iEm5a3EKb+wf6y31mYTImtmkfKgViMWXtti2k6qyught+ricxhgsnrzaDiZKQpJ1Np8w==
X-Received: by 2002:a05:6402:348b:b0:5e0:8064:b42e with SMTP id 4fb4d7f45d1cf-5e08064b595mr8838593a12.25.1740061065289;
        Thu, 20 Feb 2025 06:17:45 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f59sm12124224a12.6.2025.02.20.06.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 06:17:44 -0800 (PST)
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
Subject: [PATCH 0/6] media: v4l: add support for Virtual Channel IDs
Date: Thu, 20 Feb 2025 16:17:22 +0200
Message-ID: <20250220141739.228714-1-demonsingur@gmail.com>
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
 drivers/media/i2c/imx219.c                    | 54 +++++++++++++++++--
 drivers/media/v4l2-core/v4l2-fwnode.c         | 15 ++++++
 include/media/v4l2-mediabus.h                 |  5 ++
 5 files changed, 84 insertions(+), 3 deletions(-)

-- 
2.48.1

