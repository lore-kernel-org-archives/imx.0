Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA98443A88
	for <imx@lists.linux.dev>; Fri,  2 Oct 2026 07:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927807; cv=none; b=KmHb2DlNWT1Aq6ebRl+uMt6U5KlkQejiIN1AeJIoWKIDY4Mgn2flX5dOyspno/V8i6WEe54WjqI1K09FFu3IpNPt+LuSi5veRlVDZjFvzDd8946IdtS8RjdVmI7C44R8FLo4v+PPXqVIJAh8Zx7yvJFA60RFGVhOVCzsKGBnKsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927807; c=relaxed/simple;
	bh=JeNxMWZO1rRtu4rbEuExcXII9g7Ou5O4PhCtCbJm5wE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fOzkqN5Smq1W/DVgJBkihUKlbnfLmZmKkmbNn5hHZHKXfieFLW5Zk1DGZqpvrYbSgEmR8JRzoWLY2U+tgv0CZ3TRCkkcEXKFeG3thABrbRq9znBzJyBb+DccHvnN/UD6WzkivouRvHsjfh02NIcIwO0Cm1zc3Na9FbZfIdpoOn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSptJito; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSptJito"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a022e9cbebso10562715e9.0
        for <imx@lists.linux.dev>; Fri, 02 Oct 2026 00:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790927803; x=1791532603; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DK6t/sZOXlOI0flttlBEPNoSoc64x5EacC7Gj68MXFk=;
        b=MSptJitoyOeN9ZDkOuZ/Qozfuhl68umJOysHDF3DoB4kl7TEon4L937I3db133HIe6
         nY5+9vyWUoMcdJNeW2eW1+hGjyLf/aeVEF8/nl7KaolElqqXW2oHyqqac5+FTrCmdcKh
         4c12lU0tPnCmMxfxj+bfBZvakYzqievk9A2LUF7WjIRdue56S+4HRY3jFZRjgzqNqbKt
         ShYmFkMVexTnq5hdkywliCtxkv+9OFgn4WXViLIn5VC9SYlebCZFtQ4iDfjCS0FVNXxt
         B9GxlSyUO+sDzNR1oB1TquWusCMZdoLY4s37c7Kk38nsqpKYBZ4F/N52yfeCyO3gzIHz
         tc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790927803; x=1791532603;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DK6t/sZOXlOI0flttlBEPNoSoc64x5EacC7Gj68MXFk=;
        b=X4frJRzCp42CHjsxVtP4GLLMbDudtOAm6tRMsQUiBO825t5Tq59GA2/vvFrndnH1Si
         2rh/BFwSPbNwWq4BjsRb5iwrlSHfd4x6x0DB+qD5M/cFp1MmJnviNIrVL2qMJ2IZZQ17
         /GC11mnOF8x2yGvVFw8IGMc8/xE5snZg0uiu1dxVfqu/68vKPLqAudP8+Lvfe5/g9kXr
         +fDgiMPqfJdmh9LWjmz0qISfqlw/7udDVZ6LSAegI/tBiQ0RwQ9BHI4Ja90SdT9CIzFa
         2eQjNuLGZSupXIE8qzmV4j5YItJU2/y6MbagGyclXdZbQWkJOydayT/822/1h+gqj8C4
         KqHg==
X-Gm-Message-State: AFuF++lyy48bo7C9CoWKHf+PZ3YaoTztp7pGeU/vJonR7HOugyoq9JLB
	Q29NLGCkkRpz4F9OAlTHJ3WaVaj2VsCFFVC1hZ7pR9cnJhH3HX58wWEZ
X-Gm-Gg: AYBFou1wsuhoS2JKgjrIiCrTn8ZqgWKbKva1kHUL0o3//9X8z2S/GSclSP3DViqCjRx
	Mfrh7yiQV6+3CXDloAFJuImoLxU/BfzRO0XISFBkejVKx5wkJcyHn0mHlZbUDnwd/CNJOmM4umR
	bJu5BmyLpCDHFkAKP6bFrW4n/DDm6B+clsoVDgxHqV81B8k2m7LdzskwrgptI4mHxphfWx7nNbN
	xzYJlH+AwlWTKIrN/iYRNbU8j915Yh8yDmtJ31GiL1wvISwCg/Lxrnk/8McrOXNdtILMCiZtFEN
	rh46hAavFrEiAGlnqu96o2oN54VDjzr+FpRL2AWzlxpmF3emajvr79PSjirgAko2UhX4/Mw0N7C
	rXVv8I/MyWlFOMGAvb3M+C/jWefj7KosnXKWhTrUcDL6rk6mjqDLFHeGpmFNa4KBzi0qjhsxo0I
	kgf8dTRiiUxo1NHJW8dgFQPpdi6ety1jJbS1SjknaCjy+fLm51TasPt8yndsoJny8jaSV6IS49u
	yKCnBJwJUnZRtU8pZy+wovKACBs/1FAkA94E8vfpB3bc203CO79U4Tsv4G2XMgVg3i1znyyIQ==
X-Received: by 2002:a05:600c:8b2f:b0:4a0:e45:e8d6 with SMTP id 5b1f17b1804b1-4a027559b0emr30989015e9.13.1790927802784;
        Fri, 02 Oct 2026 00:56:42 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280be5dfsm63635305e9.7.2026.10.02.00.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:56:42 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH 0/5] arm64: dts: freescale: Add SMARC iMX8MP display
 overlays
Date: Fri, 02 Oct 2026 09:56:36 +0200
Message-Id: <20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALRjv2oC/x3MwQqEIBAA0F+JOe+AKYTtr0QH07EGshVndymif
 086vss7QagwCbybEwr9WfizVbSvBvzitpmQQzVopTvVG4WSXPHIabcpY2DJqztQflPiLxrXaqt
 7EyJ5qEMuFHl/9mG8rhtBB9uObQAAAA==
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

This series adds device tree overlays for display accessories on the
Toradex SMARC iMX8MP with the Toradex SMARC Development Board.

This brings SMARC iMX8MP display support in line with the corresponding
Verdin overlays and makes the same Toradex accessories available with
the mainline kernel.

The series adds support for:
- DSI-to-HDMI adapter based on the Lontium LT8912B bridge
- Toradex Capacitive Touch Display 7" and 10.1" DSI variants
- Toradex Capacitive Touch Display 10.1" LVDS

The Makefile entries build the standalone overlays as DTBOs and add
ready-to-use composed DTBs for the SMARC Development Board.

The DSI-to-HDMI adapter, 10.1" DSI and 10.1" LVDS overlays were
run-tested on SMARC iMX8MP with the SMARC Development Board.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Ernest Van Hoecke (5):
      arm64: dts: freescale: imx8mp-toradex-smarc: Add DSI to HDMI adapter overlay
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 10.1" DSI
      arm64: dts: freescale: imx8mp-toradex-smarc: Add on-carrier 3.3V regulator
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 10.1" LVDS
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 7" DSI

 arch/arm64/boot/dts/freescale/Makefile             |  16 +++
 ...x-smarc-adapter-panel-cap-touch-10inch-dsi.dtso | 123 ++++++++++++++++++++
 ...ex-smarc-adapter-panel-cap-touch-7inch-dsi.dtso | 124 +++++++++++++++++++++
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     |   7 ++
 .../imx8mp-toradex-smarc-dsi-to-hdmi.dtso          | 103 +++++++++++++++++
 ...-toradex-smarc-panel-cap-touch-10inch-lvds.dtso |  80 +++++++++++++
 6 files changed, 453 insertions(+)
---
base-commit: e7a7fb1dc235053369094c3f8afdf67fefd67983
change-id: 20260930-smarc-imx8mp-display-submit-3a128293dfec

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

