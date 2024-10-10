Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0704192B9E
	for <imx@lists.linux.dev>; Thu, 10 Oct 2024 17:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728580320; cv=none; b=qPGoIQeJZhuuNT9LOsz5fCcPEPUipU+61dHPYgX8mRac/6Yt2VnuUL0JJ+qWwR8mrx37GgWj6g0UVkW0WWKbeM6HcytBBWp+D2BNAQ/i52o1qUD7shWzvS6olvqZ8JsfNUX2ITPtJQqVvcBEmII2x3S9T1Li194Y8+nzU2S5bug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728580320; c=relaxed/simple;
	bh=1RpRdsGO3jaA0TDmTTsokF9K2G0CK52NDNqsAWdq0yU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FV12cqap70kuG/0CQO5SBcZW3KyBK0kjee+hY97ddOxIHyk6UGXZ1/7KnadgKd0t/vCB7sCQ/nvHOwvF9+yL9sLGdplHAT2tEiNEXZvSuoTNh9dkh+RaKbxzpyOiTFdS8t3w8Mxfso1QZZ+6Ak1koShxuaj5WiBViE89FBFPX4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFPfC15e; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFPfC15e"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7cd8803fe0aso828353a12.0
        for <imx@lists.linux.dev>; Thu, 10 Oct 2024 10:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728580318; x=1729185118; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AWNpFyttizV4KmPkZEHOHP1DUhGOOJ5aGc8EFxnmw6g=;
        b=mFPfC15e82U7+y9GwmSQs/eo/TsuCSS7CSHWWpey0GsFs1ahkSPQOtObt1m9VeTwUa
         YYVKr0eVQsrna9oOy6H0fasYtmqwP4TETfSbYyT0L9C+T7s96cEIV7xdUN19iktfTeoQ
         QAOtUapuAiE6RXFBR5n9CZbNqMIrQxqejjbxUd/rrlYdjbvUa2KWjRnZr14q9vcwV7L/
         58fBURVLtorc/HaR6RZrd/+7/ucfkkr9nnlJULaHY9pr/DflbOjzD3n8WSoA+CY9QUg8
         RE9RNAtRIZEBG+V6kFLmtRDrDvyxvtofo28Y6/eCLOw5eZdCPuhaIUQNG0Y6esYnuXeg
         thXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728580318; x=1729185118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWNpFyttizV4KmPkZEHOHP1DUhGOOJ5aGc8EFxnmw6g=;
        b=clhMfxIrTCxeUGA7022aWidGL5y6BQIyQrPQRdmW3F8sk6FQMhtGgIxhKRBQSY2tY5
         +WGr/rXEcR3gpCMcldhIOjoDBYf/Nqihe2oHK5KI3JlPvWF4Ix3S8SlhElbJNdIOEj6I
         EGL89Zg1QHlutOpkKDgIhV0re3q+X4t9R9nRRGRIYxEfyjPgYWSikWULicVfyuYXdeZR
         WiOBqB3d5jmzTEsZXZSeZgWu8wWECQk+2Lzcsx/ahQ0zvAOZg7CkRQCd0QWLs43ckY6r
         TRRi7A2qSYOxc5Pp88qhCI/78Ju0HSEnLIDTcyF3CV5RSJ+F/blDT8RIoXvHM7/H7Fmm
         YMmw==
X-Forwarded-Encrypted: i=1; AJvYcCXzXwkOFbRxrdfWlXKluYMQTSO92H8w0AjN4juruHnbns3XFVyr+Rm2NOd3gJZxPL4ngPs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6+G1sc/0an6fVjP2UsW0kEhaMWCKMfA1iW9YEJm3pssB1Yc8A
	VqPEmXl+6fYmaqhHlygLO/2+eBhYCcACLrQTGfL1HeTUHk2RBMQQ
X-Google-Smtp-Source: AGHT+IF8/tO/ZwooAvWXV18apVDxs5Q5LHIxa5XRsn0nnhK6uLRlS1lqRXA1h7+5ixNhdE7BmxZ9Zw==
X-Received: by 2002:a05:6a21:9688:b0:1d8:a6bb:2782 with SMTP id adf61e73a8af0-1d8ad86106fmr6810637637.45.1728580317886;
        Thu, 10 Oct 2024 10:11:57 -0700 (PDT)
Received: from hiago-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2ab0b5d3sm1251245b3a.198.2024.10.10.10.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 10:11:57 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH v2 0/3] ARM: dts: imx[6qdl|7]-[apalis|colibri]: Update audio card names
Date: Thu, 10 Oct 2024 14:11:25 -0300
Message-Id: <20241010171128.107819-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

This patch series update the audio card names for Apalis and Colibri
iMX6/7 to match their specific SoM names, making it shorter (less than
15 characters, as shown in [1]) to fix warnings related to ALSA in
Apalis iMX6 and Colibri iMX6. For Colibri iMX7, also do the change to
make it compliant with the other card names.

[1] Documentation/sound/alsa-configuration.rst

v1:
  - https://lore.kernel.org/lkml/20240909114902.82380-1-hiagofranco@gmail.com/

v2:
  - Update commit message to make clearer these are breaking changes.

Hiago De Franco (3):
  ARM: dts: imx6qdl-apalis: Update audio card name
  ARM: dts: imx6qdl-colibri: Update audio card name
  ARM: dts: imx7-colibri: Update audio card name

 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.39.5

