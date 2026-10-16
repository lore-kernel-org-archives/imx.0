Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC1D3CFF4C
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 08:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140056; cv=none; b=hTx5HhI/Y6qUNHI+V2Gm+pSmFBPxCtOcdTqHREA4/IF7N413lp16K6U+inGF5fvD41LPP7viXQzzFX0/bPV0U+LpF9J9dRyxL8WRN6uDILLgu1Sq34H8StnIGcmlxZy1BYL558ZA+upqYMA/EIiS1zZml0Mo165K9p+QZBDgXDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140056; c=relaxed/simple;
	bh=zCNrwnurgO+KAhjv03oxH9hTcLmUU1xStBcQnjNB2S0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hyys4cYzK07tIw6Io45BUwj0RYYet9SixI8pIXtYB++vdBbIr3J+mCQ70E3PMEmCxJr3YZEhDsOSxEGt/jHHWkjKsv7mnWCAF3jvPdVCl5WGMyXuZ9zj+133nKMPc8z45B6OgwwNDMw5+Y/AkbxTF3theNHDeCg4Pknw8oG6DhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3BCA0z8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3BCA0z8"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso3226125e9.0
        for <imx@lists.linux.dev>; Fri, 16 Oct 2026 01:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792140053; x=1792744853; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+GyvDCXoOZxhaF1YO2iBjYziahy1VyrzPfIWpLTL1Is=;
        b=Y3BCA0z8PEiXJUcYFKrig9byYpYNUBxMU+AwRIRoVoSdtAz9FZRlXk+8PMnsD+3oER
         uZ0rdSQliMUyFfTgZFvLWOe67mikfM7AJDoA/08Hx6mglbaWvFu9hfEcvDfB4zFG5/R8
         hYXFA5Qx6uiRm0yjuxJYk0MT0ITAiGtI813eaAlsYOJkgNXSPmHSPoO/8cxGvAsIPIVH
         87fkJbBoa1Mm10kNg2hV91fTNbAEI3uy/R/ZdoutXtT8jhNyQHxYWGEjRrrVSCeo4Wfe
         krgZK5pNxy8zeNBAMgbROkEet88qUhsYOuy2ju6NaqQhjLPQeU/Z0uh5uoKjy+7MJOoC
         V/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140053; x=1792744853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GyvDCXoOZxhaF1YO2iBjYziahy1VyrzPfIWpLTL1Is=;
        b=f1yM/JFdUDxP69eQavdxn94NJn0lWUkyeyc+6O3AGZs4/2KFxLcQZ+4azZdXf9cfJe
         uV2rjE2sq8goGt6NDs456SbMFTpKMDyQQd4O991ZU2eKaRyhJ1/b1wQK4bYCzLi17nXV
         XB4PirbDyc3w/AlLavHI8WQ7gq+w7jf4e0EFjkZni5xYln9iCOW/bKC8dQGSEWNF1F1X
         4fSvZYo9IBQoWe1fX7gjfnMChAi4Ehu1SXnmCQfZvynO8HcKxPICRPiJ+paTfR78TSga
         qMuq+C1ZYZ3wDxjkfAeNTWqCaDlEpY24xBdcH6yuvQf6DpGvb/L3Gw7ilNnQmkOmeqEL
         wjjw==
X-Forwarded-Encrypted: i=1; AKwUvBzTNcjr5BpXZUu2a45i83Cek6rzGMn4emwCzC6TuaaIjye8CFFxqWpbk/hy0fYy6x+UQ00=@lists.linux.dev
X-Gm-Message-State: AFq9FYIjr9wcZULzIj8qYCrKPc1VuBt0NTNNbT0L9CigfM2AGjFKFKMJ
	HSGbhmKmw/K3DX1iITBvKkYGulbEhpJol0De99LGokSZia94DMOXRzXk0QWBOQ==
X-Gm-Gg: AYBFou2divxF1AUwuS+nfTtMxSOQ0D+UQHG/6gqZTLSINvMuWRT+qT45Yi7sABfWyF5
	6IYN49DX5Of3zrsCnggRGg4g31C/UDcGdTM1D38TwTGahabRvVDLzOXk3xFmIc5tTnKl+IrDUoA
	gF9BxXKjVr+qioTJHzOoNfpHGX4bSJLTr3xRMfhjVbHL5jxGLl7w05pOfbCJtCc0OsUQhZXdh+/
	JpERm4qIXfWeBb3U1FT2FOfyUGZrjuX7vj/UaRuquVIDvraIZOrjh/QXDUmMATl10Ji5iMjQyAJ
	e9LGl7VAJHvleTAFisRRb5sbbGRFds/kG2uFV+npjEHg5MPmyBxfzMh0ZwYQrLgEJKgYqIArHlU
	2ZGIaB3HC4uWdMxB4BMEcBvDrqSv19Uwi5SewaTg2wC3KQkFQn48r4VSIYJIXEmC/EyIebjpA87
	WXKrGArWg1b3DsmjuuSAXowXHUGqOkIXW8UAytSopD8G/NRdTPpWLBG+v+Sa2lvEcGhrJl6SoPU
	e4uw3zPjlAfnHpMAh5ZZY5rK/taIsHXwV+SosjftKmK8+Nya3zCOLSthicEW71TrMEJVNdQeEvy
	rthYZb5ZyKPPD0+/oIQ+bGzJgSUnzRn+
X-Received: by 2002:a05:600c:3e8f:b0:4a0:263c:704f with SMTP id 5b1f17b1804b1-4a18e4a3fbdmr441778475e9.16.1792140052601;
        Fri, 16 Oct 2026 01:40:52 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5033a2sm3715233f8f.45.2026.10.16.01.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:40:51 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 0/2] arm64: dts: imx8mm: Enable DMIC input on Variscite boards
Date: Fri, 16 Oct 2026 10:40:09 +0200
Message-ID: <cover.1792139809.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series describes the digital microphone connection to the WM8904
codec on the Variscite DART-MX8M-MINI and VAR-SOM-MX8M-MINI platforms.

Configure IN1L as DMICDAT1 on both platforms to enable the digital
microphone capture path.

Stefano Radaelli (2):
  arm64: dts: imx8mm-var-dart: Enable WM8904 DMIC input
  arm64: dts: imx8mm-var-som: Enable WM8904 DMIC input

 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 2 ++
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi  | 2 ++
 2 files changed, 4 insertions(+)


base-commit: 31f9ec9f38735f42e1f0ba57347c420e56b99824
-- 
2.47.3

