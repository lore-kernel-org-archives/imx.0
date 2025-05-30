Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09FF236454
	for <imx@lists.linux.dev>; Fri, 30 May 2025 16:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748621286; cv=none; b=CLNdBI96Vqc94GQhafqufaRNd9oZBRVVa/DQeqOFOYJj54byL2NGnN1/XESOMHq41+L4V4Xgp33ZLbR4o9PFeFzDRmF9YxqmceQPZkFO9F+31SheRa+txoWj8V0cpZXsi0PjOQ6boff7aoKlLCXRVkIbGRYB2Ewr8S+866diKH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748621286; c=relaxed/simple;
	bh=20+CDTw4vzWKnMq2YhSJ3lSPA2rG6reE6EsPNfWd2IM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H1X3n6I6+PcmSMN4H++j/Yix/C0WCb/ior/9quUWdMfv6Nq2O0yhOpyZRLqLtG/dlqAd4N3VT8AWDBH3rAvDVzNDutNKGcgBU1WThD2G61MUj05sEEcj0T3TOndHULBt9GWYuraAa6HJjfvpPNd2tibdcqR/a4Lf0dhG5skABbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=HIFzNOJY; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="HIFzNOJY"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450cf214200so18442065e9.1
        for <imx@lists.linux.dev>; Fri, 30 May 2025 09:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748621283; x=1749226083; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvgM2IbfWBcG4/oTfKmRrdxwIvc181owD475503ERJ8=;
        b=HIFzNOJY8ZHRC2P8qtOw6g5kGYwVHW2fUANDRuZE+u3aq4qvlaoVIRpxGiEGDqyjju
         k5aAC4gb7o9Td8exIth+YTg+gjMauOfK06A85IHAaBRb9T6WpjHrStXoVWh963+WhWvs
         NrRLMxRL9bqr98eSEgqnm35YjVZODOxeL9T7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748621283; x=1749226083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GvgM2IbfWBcG4/oTfKmRrdxwIvc181owD475503ERJ8=;
        b=AsdxE/n0oDvs8vPmPvplTe+cvx7QTCPQga8KLiivJtqj0QRmWl0UmcUeKvR9bi9BBF
         5sENu5Ur7igRrtDZLhpZaFHtbUFz5PCTZ5JNnH5oxCSDn34aNuQlfYU8kuwBz0/T6yxy
         JOkFdb/8KQCAeG92lhF9bbLZSI1SLkgoE0eQmi/J378VwHlw9WhjvicfQ/xIhiQ3oYY2
         /9VUZSjPXf9qXGUKqzVQuOQQAKbuEUQweXrfRoaKJo6e2iSQ2B+Aq1aKsZbcWD+1xsMh
         yVWAJfAXs8lQ3pn6RgRJRF5u/IZKzWpDkSqZg2f52pK06W//VIaeGeZWREnKzvYMCYLT
         desw==
X-Forwarded-Encrypted: i=1; AJvYcCWSoDMTopmlzcmVhLyqTHq4PXbBcUec6pe6EhmdLwPU2URfhFtqQ2ao9S5maFo0OmZGmFg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx53avKHax6/MhuwLAErRKpMLdX4UFvJhEQ8V3lbRy69sM1Gx3I
	J6Po9aTkQTdw9CmkujTF0BZ0+YTGSfEMby10tjlyToEQ5jdJ/DEXiNe2s4MEbfInDNY=
X-Gm-Gg: ASbGncte18VzMHSzENHg6aU0DN5lC0IZPmH4x826noicM6CwKb91HXQr+E9U9VEmr6p
	bfgTZif6Qo0vMG/Pfi1thzIO4CLZfBxuRNOSI7SuFT3jrLCoqmBEJ45stCIzTc+7tycNLtQN1cI
	6Jx69rNbeL1Y9pYDIrjVr2MTNgyy54NPvVSdhqFcB5qZFYI7VGYGoFvoJzHYxn0ZJHWV99qbyI9
	LP/nYMtUTBvnymR0VnlHyzKXwujQARrrjmdQVwHFf5KMAc5mNeZmqyGqpo+dttToU7drtjLRwK7
	gFjuDXHOfbGIm+CqrwnbqxsDAe8ukbxt3P/eLD+K02W7sLnIAjQpRcA8leWbW5TJ6WvytjVs+qf
	wnnK7UNQys85ELMMhI13WzOWNZPRANXQQKxlZiYdTrPj/B3AYnyg=
X-Google-Smtp-Source: AGHT+IFYdaNMtebMqrcyfFwd8HXEmCu6MtcABHOw6woSEVwRzVUsS88bwdlnnTOG4SmcQTNczADG4g==
X-Received: by 2002:a05:600c:4f87:b0:442:cd03:3e2 with SMTP id 5b1f17b1804b1-450d87fd991mr30332145e9.2.1748621283200;
        Fri, 30 May 2025 09:08:03 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dcc18a80sm9716365e9.38.2025.05.30.09.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:08:02 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 6/6] ARM: mxs_defconfig: select new drivers used by imx28-amarula-rmm
Date: Fri, 30 May 2025 18:07:37 +0200
Message-ID: <20250530160748.2476088-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
References: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Select the options required by the imx28-amarula-rmm board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v5:
- In mxs-lradc.txt:
  - Fix deacription formating
- In imx28-amarula-rmm.dts:
  - Drop #address-cells from gpmi node

Changes in v4:
- In mxs-lradc.txt:
  - Fix typo Low-Resoulution -> Low-Resolution'
  - Wrap lines at 80 char.
  - Drop '|' from the description
  - Describe what each interrupt is for.
  - Move touchscreen-wires constraint for imx28 to the top level
- In imx28-amarula-rmm.dts:
  - Drop label property (deprecated) under the leds sub-nodes.
  - Add microSD comment above the ssp0 node.
- Add patch 5/6 "ARM: mxs_defconfig: Cleanup mxs_defconfig"
- Add patch 6/6 "ARM: mxs_defconfig: select new drivers used by
  imx28-amarula-rmm"

Changes in v3:
- In imx28-amarula-rmm.dts:
  - Drop xceiver-supply property from can0 node.
  - Rearrange the order of specific nodes and properties
    alphabetically.

Changes in v2:
- In imx28-amarula-rmm.dts:
  - Replace '-' with '@' for the pinctrl sub-nodes.
  - Replace edt,edt-ft5x06 with edt,edt-ft5306.
  - Drop LCD reset hog pin.
  - Add correct #address-cells and #size-cells to gpmi node.
  - Replace edt-ft5x06@38 with touchscreen@38.
- Drop from commit messages all references to LCD display.
- Add patch [1/4] "dt-bindings: mfd: convert mxs-lradc bindings to
  json-schema".

 arch/arm/configs/mxs_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index 91723fdd3c04..3b08c63b6de4 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -64,8 +64,11 @@ CONFIG_INPUT_EVDEV=y
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_EDT_FT5X06=y
 CONFIG_TOUCHSCREEN_MXS_LRADC=y
 CONFIG_TOUCHSCREEN_TSC2007=m
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_PWM_BEEPER=y
 # CONFIG_SERIO is not set
 # CONFIG_LEGACY_PTYS is not set
 CONFIG_SERIAL_AMBA_PL011=y
-- 
2.43.0

