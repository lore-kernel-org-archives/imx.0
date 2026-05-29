Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2150F36404B
	for <imx@lists.linux.dev>; Fri, 29 May 2026 10:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049475; cv=none; b=F6uZKxQEUEcn3Mf+1LKmjPRRXxyQ2Snm6tcOTC0m/6VEsAhmVgayRPbqDPUhKF+8+hqyB5s/a1Tp/fTo8uejogNjiTrmNCJCd6guYpkYHgBKjSFD9kXjxbrCkuMUGyXisjvp6mLijL4/WasRuFIcyE/Wr8RBI14cKEin/EqNmrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049475; c=relaxed/simple;
	bh=2TNoC4iE2ZdHY+NdBz/7JWkGjU8w0uJr7p3sLok27iA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PjeB1kw4n9oBFq7wdoAZn2FP9tNknE9NEwlzl05mjCUUBudDMoYWM3pGLq8EhqWrq7PBap0mirwXjlCRRVj75uhx1lyWttGUDq1ZrgBNyfHYYKCmEnd46NtltaQ4Fl64ng+gCI5U9GBqJvEfI41sw4MFITn6YAXf+YkEjxwMXoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwUdWpfc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwUdWpfc"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49050bfe053so43489305e9.3
        for <imx@lists.linux.dev>; Fri, 29 May 2026 03:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780049470; x=1780654270; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N9pBkAXW7gLZd8FKwdSxA3ABXZRrpLoJn++TQ4FzcjA=;
        b=FwUdWpfcjalbmFZn+o3+EcXEcL+J1Jo0Fv9AONojlwNrIbxNJXn4GAgTYhvuNnTSp8
         UaFCNYTkmmYkSJzvN4HVslQcLZgMfs0vSxbWzLa7UFqBhY2VhCTLN2N7OFEmIsV7h5R7
         BSad4xoOQqwKLArH0Q7kwQHn9O+GB1cGwTARVjjesx3r/bmamYiqfInOBxZnBg4XDreG
         EYJLVpJ9FVbFWBEU64Jl2kxrP+5vg8gHrv65+RIZWhRdeIq9BIL5Ryigh+KLbrQyIs+l
         r14aY6a6kZjyGCB8slgqJ9q7U2nC2TwSivXB6+k7fK5tV1QOrjC5mRxKhHVQO/+8v+EM
         nbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049470; x=1780654270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9pBkAXW7gLZd8FKwdSxA3ABXZRrpLoJn++TQ4FzcjA=;
        b=A8KQfPE9DrMsadaD5JV439ND7OZFok21IevL/KhzACsvKn/+8hh62Vq2fjiYI16nGk
         jYUywWc5/YPEdk9ZZkOTjd+O0hCmxv874pX5MP86zjZRCYY6MoMXzxMSzXr3iSD/6tVd
         c9tZjBWUQvIO6q7CewgCXFUonoeJmNgqt/F+9WlKyYOk1uPj6hHP5kCjtKq+CkjIFBgE
         f/IQo/CSzVvhXoNwq2qVvAHVpIcbZkc0gzr6F14YT8ZEsQA8JUcwWiObGtjSwqMAMI0r
         n2phXTtMwr4i1HYY0SMPHkKc4RL1OWyvEaPObD/ENGLpCVvNAGHo01pwpqfnH6SfuJtE
         d6oQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cN+YLIHXhYy9FpBW+T5SHU1NsCf1dAt0/cg2ye3cAwEMCtasXupqrU+R7hwgcF8WD0uo=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywfqi3pW7LPcE+bxfJV0JscmFidLC4D+gR311HFRza1ZWCvtXxx
	RJycfI7hG+61+zLy91tKLNRY9ytOlm6Dvs325CV8nFVm+A2s4IKzHXjX
X-Gm-Gg: Acq92OF4ShUIilevBvakOtvmaQFRjh6qUt8huoli2YpVdbfsU86ynTR5pPO9Y51rC0o
	rz1R9lJwC+eT0p6WsZBCAUEeUVyLYMT6gwUvdm+LWMUTUAWxG4q+GzIgAOcr5YGHwkINYL4l4B7
	LoXRH/ChyxAIH2o6295v8RCBM2oZuh1VuxPOxq4Dih8XpsxaRmwjvSDiwTb555u9uHzM8V3QYSg
	q4mcqMjgB4vOir0jfwmDehXXy9npm7umqcew0sbjwpLNgKvdb+0OzvGMITCAnlS18tyBsBStMMX
	OskjfhcclxMAbewEqtn6xNZDZT12oLTDvJBppEPOB8OWVtlP+sHwmQFEv13njyGz0vI8IkwHYHc
	yDL2qVO282yxruApGGUqwXsU0lBJK3cnPmpu8tCsLOmuaYpHlZADhw3GKBw85W2zo32mf4kndmD
	Ctjs2LmTbaoNKL6BElU1nUm4BrLp3X1CJvjAsunGYw9quyANcRFCNXR9dUoIyReNbShaaRshi8J
	a7fI7CnWhdd29Tz9pW5KQOEoeDIIYlRmEVTf0Ou/zZIDos=
X-Received: by 2002:a05:600d:6413:20b0:488:78f2:6b0 with SMTP id 5b1f17b1804b1-4909c0c9f56mr31124965e9.29.1780049470077;
        Fri, 29 May 2026 03:11:10 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909caa7faasm34551025e9.11.2026.05.29.03.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:11:09 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 0/4] arm64: dts: imx93-var-som-symphony: align DTS with hardware revision
Date: Fri, 29 May 2026 12:10:47 +0200
Message-ID: <cover.1780049085.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates the i.MX93 VAR-SOM Symphony device tree to match the
latest carrier board hardware revision.

The changes add support for onboard peripherals and complete the board
configuration with the required GPIO, pinctrl and PWM settings.

Stefano Radaelli (4):
  arm64: dts: imx93-var-som-symphony: add TPM support
  arm64: dts: imx93-var-som-symphony: enable UART7
  arm64: dts: imx93-var-som-symphony: keep RGB_SEL low
  arm64: dts: imx93-var-som-symphony: enable TPM3 PWM

 .../dts/freescale/imx93-var-som-symphony.dts  | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)


base-commit: b3c1d1631f097619f8091f0293e027c4301285d6
-- 
2.47.3

