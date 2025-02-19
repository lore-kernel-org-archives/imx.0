Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D41C21ADA9
	for <imx@lists.linux.dev>; Wed, 19 Feb 2025 19:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739992307; cv=none; b=PFjcTIBiouewxY2cUkq9ccQlrCUDlapugnxjZsALuKx0sSpvW9jLW747bdss7ZQqloyPIlJUT0j7BuzZ3vFLpyrINGzfmKfA1Ga4CQu8tzIiT5chN1gMmmFuUw6KARkQRPy2h1PiR/2jJV/WG45fvKqJ3lbysc80LVgyWOG9MH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739992307; c=relaxed/simple;
	bh=FokUvGzTSI9hIbd2H5u+cn8FMk0LbJzXrBt0aXU5UBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=foSVKbsTYKwTVERWOole608KL5fVod+tDsh0OaG/ujF6rbp/CJvEMgp9+FzB60IbZHQozxyn8Z06hoxNOwfEzt2rS8IB1YexR1fjk+rPYSLA/4nztmjN9mErfr79WGSDnVrRlm4LpTH57M4FSZNZWyW/nDccfJjdnF3HKM2V6uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1bxW+wS; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1bxW+wS"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abb79af88afso34925566b.1
        for <imx@lists.linux.dev>; Wed, 19 Feb 2025 11:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739992304; x=1740597104; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iw+WecHf0QEZQa5MiiCupXdrm6woCUMUehYbzlS6fgw=;
        b=L1bxW+wSGKpfifBrSctjy4BZcjIoTCbfAj7e8T6K/ocHqyvN93ybIPxC2jn/38fNiC
         uDKGSXPvo8Z0XVCGSXObq/G0D6eUJtTObHZjsQcKBIshrHaz5Z5W1Q/nRQqLU+x17fRS
         tPa5D37/RX0V4huBD833XiW4tMMHUG4sI11q+1QtDiWBXZUh8ekLC97/Nz3gs5ZRyA4W
         JZvr+2m+QFQQvM2Q3fLmgC0w2nxLC1Yq3RZmtrJw/38Eif4I0kYXXUj0oELCPt40TKSi
         /N6QJNx4LArje/Qhws9k99Pu8lx04wwO3LmNiQJKAyxBDBpIEIKWhGmbYM7U6jTxwUCX
         rK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739992304; x=1740597104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iw+WecHf0QEZQa5MiiCupXdrm6woCUMUehYbzlS6fgw=;
        b=k32W8+Y49UOLaTMTKp1Xe+0SPKnXBE0Bk2UsGC6LfOzP/+QDkxajnxL6F+yU9u+SdK
         POftJBGm8tEw5MyIepUdhmgtlYuWZoJZB5l4xQDXQ5xL8yVlfZnNLhcUSHkwLV8j8OGe
         /7+EFpLASshoWw+trj+HxjT/BLZZ5oqk8kWzfRsl6Sulflo7DCvxqLUqe1raOmd9nIuQ
         neDEYRK6GfQ2wmdtgI1IZUPHM+OJxnDvICzjKtS79kGwMYw3hn8ua7UqQ5O6v66Q9Awx
         DJhUv+DLdifUoFLkOlIROvm89G8K7Lpo2NRlu3NE2jzoNRVk9ZVRIgXHtTO74uNl2fBr
         tyqw==
X-Forwarded-Encrypted: i=1; AJvYcCUrAgHj2y0/ZrKxXzPN6DeCDv4EqhMlY1xPJ/bSLT9XUJOWieevE1TTyAVBukDZcyyAyjo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEIJ5oOiipLsTci6UhHwIfxZ7TzaDkg5vYXTwR9Mii1CuERSi4
	X+5QF8YfB1bQrEvcOvqfnJqEQjDdLU/Mtwuicbd/X40hj3ZZ7/zj
X-Gm-Gg: ASbGnctuBJBGLZAkn0TMtpCzrjT1828eo2WbxCThFKGNgHK5xq44HLML1xvKraHUsPG
	qnwnJLcLRpC7AfS0UzahlxheObKI7/WyiYBFL703w66iky+27gq+AIgoszkBCglHpYQ7quhrBE/
	pj1sTKXW5eOQGunP0adE7764feVFYVYe6+DnmTxJQUrlEWxk7HE2JKShNYKS69RdDrKbKyKXW6s
	MrYcb+MIIMo8latVCuiDxkPgqxettdorl/SSJuS98Iv7ubhUsEFdKCie25H5Ntve4VVhwixjg5o
	b/z/0uuAfnvqJEM60fJ5hALTzTz7
X-Google-Smtp-Source: AGHT+IExsfcOTzNXWdNX/MrDn+3r+Z1RDoKYU2juHnsdyNky2ySy69RRBxOFeMW+7W21mr37N0NBsw==
X-Received: by 2002:a17:907:26ce:b0:ab7:b878:e8bc with SMTP id a640c23a62f3a-abb70de288cmr2281215066b.38.1739992303417;
        Wed, 19 Feb 2025 11:11:43 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbe0d39f9csm127767866b.69.2025.02.19.11.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 11:11:42 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <panikiel@google.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] media: add v4l2_subdev_state_xlate_streams()
Date: Wed, 19 Feb 2025 21:11:29 +0200
Message-ID: <20250219191136.215151-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the v4l2_subdev_state_xlate_streams() function is used
to translate streams from one pad to another.
This function takes the entire subdev state as argument, but only makes
use of the routing.

Introduce a v4l2_subdev_routing_xlate_streams() function which can be
used without the entire subdev state, to avoid passing the entire state
around when not needed.

Convert all usages of v4l2_subdev_state_xlate_streams() to
v4l2_subdev_routing_xlate_streams().

Remove v4l2_subdev_state_xlate_streams().

Cosmin Tanislav (3):
  media: v4l: subdev: add v4l2_subdev_routing_xlate_streams()
  media: use v4l2_subdev_routing_xlate_streams()
  media: v4l: subdev: remove v4l2_subdev_state_xlate_streams()

 drivers/media/i2c/ds90ub913.c                 | 14 ++++++-----
 drivers/media/i2c/ds90ub953.c                 | 14 ++++++-----
 drivers/media/i2c/max96714.c                  | 16 ++++++-------
 drivers/media/i2c/max96717.c                  | 23 ++++++++++---------
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++-----
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  2 +-
 drivers/media/v4l2-core/v4l2-subdev.c         |  7 +++---
 include/media/v4l2-subdev.h                   |  8 +++----
 8 files changed, 52 insertions(+), 46 deletions(-)

-- 
2.48.1

