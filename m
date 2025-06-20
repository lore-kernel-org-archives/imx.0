Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07631235058
	for <imx@lists.linux.dev>; Fri, 20 Jun 2025 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406802; cv=none; b=eJseenJvS8E2DMixUwpVP/L70hociwz2FNqX7DRACQCwXULnMDrr5z1YyXLgijRNgipyXjh4WF5TuJ4YJBsrEhu+qG0ndRVvknwuGDHzZp9f9PWOu2kHMFSz3iLLunUuotaoCSFJQvOvuFud9vhJ0jICA350w/+tYjDNVwNp24U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406802; c=relaxed/simple;
	bh=bPOWhIvLpETLw9/fZPa9WPnf/zgDPVp1QOoej1cOWdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qZcOYw1p1mRqgKrqDeCaHJj4As6OSQDNOWTi4ZIw2KuC3OqXsL9NNn1PH6vjkE1SrZvUPFdvlVLi4RcVEJTrwI5GV0ONFyfphZvVsbnvZ/6r/ASO4TLBZ7aEnp0XiArzmANMC8pK08Dzjz5EmuExSbSaX94DeV0Upjg+bkoepvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=USUiR+Mj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="USUiR+Mj"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45362b7adc9so5608565e9.0
        for <imx@lists.linux.dev>; Fri, 20 Jun 2025 01:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750406799; x=1751011599; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaH9Kr0KBdWEdHexAhzixmWuUEOjZiRLNEaItTOC7wo=;
        b=USUiR+MjhLjb/jGubJqpRU/Jhg5/JM5dxdtBIW1G6pGMNUvdH0AODHTdf+bu04i/6o
         ZMPNcsE+CUxZPxi0gU9h0tUYwbZB5W3Z6cobVJkvLBn7rWdy1PRW77k2z+slkNblwzXt
         rypbuVP+ONiqJJ3Z5MOSxtLpBYHQnX+f0AFsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750406799; x=1751011599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LaH9Kr0KBdWEdHexAhzixmWuUEOjZiRLNEaItTOC7wo=;
        b=gV5T1ziBPGk6qS/UZ12cirjoEbVK7sk5gOjAFJUL0o6tVcyqgG0vDW/IFVCld1tEzF
         py+Qq6RmZMdy2dWR0tkhRUD559wJySWVAO//QeaFXRrAYF0oAIChBvvl6wh4v9kXc29A
         75PJ0ArCaAMOOroz3fFlfSPRlmTO1lBDr9xn9rxt1oLu9jqAV3LXDMyVYFGTc67hfHgX
         9U6CWEk7QeBCnS7TUJTE3gGOUAY1Q526qbH1N2Zx5LUC33kZAYXtSmfTuX+QUpyfCQcj
         ZsohyC00Je9Fix7aqmZr1/YxL3E0OZMsHhe65XkSv1FQOYP1Hqa/Jq+5hRxwPcaauvmJ
         qcDA==
X-Forwarded-Encrypted: i=1; AJvYcCVQdnm8l7SrTXKJzWS4xEZMzThWbydzG3uOCq88rOqArZotywIvtdVWzU/ineoTPSKV62k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2Dose7u225hZ3LWr6Yf43t5wOBKBBNaH2B2+6paYqgjsW+I7h
	UYBE5AN/0m52FXBbr2ApdMJgUm/4U6DzT1MWihomwSO70JmmJ7tKbnLqKqHUjWCC8zQ=
X-Gm-Gg: ASbGncvMFW7TG0mOY/93/VGNfRbYtmiZGwYEPAQySpK0SDqibLHBRz41EVRP0nsgEOT
	FeDiv+74Flp2v1ipvHmmDE4q+6xoMUnkF2awPhXHpUaEw4jpp355MQyWvMNW9Ny8fEv4aMvLF8z
	OBUWYIpAsxMcfj5a0in2mQXZlB8bGe4NZu70YohfZ2GVw54WLXKwcTrI9mLvtMSUiC2q8Q1fHTf
	/C19GUsMlT/1TwOddP/wmXPVRFQQLBlDIk6qhKWcaXvm4CeVIw6rLiyzqs9CAtG+KlKEdPZg0I5
	6z6XgZZOehG9sr9+pS0p3ETp0nrl2vOg9fRDcm0RHjxM7xPTi8ELhNPmzbRgq9N9258WLeQse56
	R1NTwwIM8UBuIcBx2fRTxB9KP3aR6chHULut5wd80MgqPk8jXWV8N
X-Google-Smtp-Source: AGHT+IH7fwkHJC3cXXyAdVYkYDzLjEdQXHbS11KLEXj8zNWxo6QfxaTajDmFHgq5T93JnBlRG9Likg==
X-Received: by 2002:a05:600c:c105:b0:453:60c8:f0e6 with SMTP id 5b1f17b1804b1-45365e42d77mr9268105e9.2.1750406799284;
        Fri, 20 Jun 2025 01:06:39 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebd02basm50137905e9.39.2025.06.20.01.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:06:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v6 5/5] ARM: mxs_defconfig: select new drivers used by imx28-amarula-rmm
Date: Fri, 20 Jun 2025 10:06:21 +0200
Message-ID: <20250620080626.3580397-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
References: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
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

Changes in v6:
- Drop [PATCH v5 1/6] "dt-bindings: mfd: convert mxs-lradc bindings
  to json-schema" because applied by Lee Jones.

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

