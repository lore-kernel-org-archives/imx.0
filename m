Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B691E0DEE
	for <imx@lists.linux.dev>; Tue,  7 Jan 2025 09:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736242306; cv=none; b=tYnh5IKSwxrJoweVpLINRC/4dp4YBAUJLDEcjXlxyS8TNlDxMx1pwYMsjTejLFNhBi22+p57GZYJtGRkhYAQ/gcFMAEE/ZUBqyfNCkK7sxRBYETGPwsOD3V3LojJM58FPMtmKQSclGRwQSk/rh5qsmyMH6Q13JkBKNN3bkRCn/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736242306; c=relaxed/simple;
	bh=wNxScV3swdqLS2kSQnTrWGwVBmGv+k7mN3nS5bD4pig=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EE5kbOp1Yd02li5oU/Dh4K1uuGy5XMXKjgVWcYZ32WIF4v7Kl9puUp31gOvn/xnmhU/nh5N8ifr5WAAwZK7oXLyTMaGVYMjpPsEIcBlbLXUnAWJZXkGTZge6DmIv+gDL0hz6C6ZTbyMc0f08ePI+c5osik1KFyvkj0BDKVmAjhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5nXJz/a; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5nXJz/a"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d3d2a30afcso28369940a12.3
        for <imx@lists.linux.dev>; Tue, 07 Jan 2025 01:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736242302; x=1736847102; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zEVZrcp6sH8kKT4/yJXuIbm9BkC4O+Tbaah14OHvXYw=;
        b=P5nXJz/aBRS7sV9V4cHfQWDl+Ve0POiBXinD/EQU50V6AhyMW/LiCV4P5NXR//cfIX
         twaJ2bcH462fth3S49clSN2BLrFajt9dsmjJC+Qg08ospAlhpM3pTBciiDTHnSS3wb03
         YqMJAv6rcbIwQEoMqF4pYyMSDGvBERursoufg6voCixfe/komPUk1eTQCyjhEcyK8Eji
         6OcYvxlX10O7ak640dXXzm2pOBVx8E2KN1di6Yp63ZukG+VfYmCwGzWwJIrH2ll931lB
         aSIHK7wkUC1gQF4+SvyFnXNMgltB1bZv4Av3zzhlWQlHvADnMUBNFyd9Lq+kjkezpsIH
         CyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242302; x=1736847102;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEVZrcp6sH8kKT4/yJXuIbm9BkC4O+Tbaah14OHvXYw=;
        b=p2JOH9aeSOWoVM0CUVm3cYhsN9jhB9oLz4RjiwpvzmrsHEp7cZeUKWL0HOWOTfOp3V
         DBvCoSbA6pLjuNDjnVpjV149XUoYGJORY25F0BTi16q2o3b6LrlR7edIlQ8PCvg0mOhQ
         hmmHR9W49eeu/CK8EdBpGQqv5A6BTXhpuY+SigbODBDK0S0mfDj8ZRQPqXyh6neiQZUT
         xPSQ+Z1z4G/TA8MwvzxDp19kFeU2w/SnHhx/c8qudN0GMLcrlQFEm+Dp1lkok0duZWfh
         ahjI3FQiXQ9yiH0uSReP/kF+3j/d7ranUMPBs5IW7GURLFtCUYNtk5qofhPviGMfkSE8
         uqnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjVvmcD173XDpgJkJJ/wrh172c5Bx/FZLhiyJ7oXdp/+iianj1vTWn24DQ7f3J0l7DGiY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwiiQVm+LuCdaegs0kAZJj9FMOgsjTPd2Tst54kXOaI5D16rUc3
	jfGFsexaOvzdCh8wNPtvAlPHJoWJ0GITD3NHuuSVcXthkrsnhd4i
X-Gm-Gg: ASbGncu65tJdz3vIm3fKPbLy4gofr89r/pJsbIBi/ASyKnl7Tsj2qDXPIVrz+hdxKtK
	VnxCUrSYkZZijp9KKtb1WYuk/uEv9jx4F+KcscIdaRS7fSLmNIznhRVLGQZbIMYY6kgD1PqePgI
	DxipX7PHosArsidsuRRNnHTlCLcbu8CMdkFFyJJM0PIxlLYFyu0AnKw9b5DCrWysE2sB5/EXkoS
	xhjy+5lZqez55x3J9WF4yW/zgHFzijKXs2asFwjKo7A7hTudFrQyd0XnIIhwyuYg0uA5aD8Izzb
	cWsPN2YD94kOLcRtmEvbYZB2gg==
X-Google-Smtp-Source: AGHT+IEVG3G336WmBhvtPtrjSoYbrfPG9f0yBDcuNNv8Va58Y4lKbJL/RINEhKFkS8DMU1all+HtKA==
X-Received: by 2002:a17:907:7f0b:b0:aab:dc3e:1c84 with SMTP id a640c23a62f3a-aac2b0a56b6mr5288197066b.17.1736242301740;
        Tue, 07 Jan 2025 01:31:41 -0800 (PST)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-232.telecom.by. [46.53.210.232])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d806feddfasm24976300a12.58.2025.01.07.01.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:31:40 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v6 0/2] power: supply: max17042: cleanup and more features
Date: Tue, 07 Jan 2025 12:31:29 +0300
Message-Id: <20250107-b4-max17042-v6-0-3d0104ad5bc7@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHH0fGcC/33OTWrDMBAF4KsErasijf6srnqPksVIGiWCOg52E
 QnBd68cKLVd6PINfO/Ng000FprY2+HBRqplKsOlBftyYPGMlxPxklpmIEBLKToeNO/xJp3QwL0
 SNkdnMCOxJq4j5XJ7tn0cWz6X6WsY78/yKpfrT4/f9FTJBfcEQTgympx9P/VYPl/j0LOlp8Lab
 n+o0GwWpssOpQ0Y9latrNxZteyGiJRQA4o/u/qfXd1s56JN3geVVNpb82sB1NaaZkmTFt6BCpH
 Wdp7nb8tDV4yWAQAA
To: Hans de Goede <hdegoede@redhat.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736242298; l=2494;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=wNxScV3swdqLS2kSQnTrWGwVBmGv+k7mN3nS5bD4pig=;
 b=1JtrugEyOnG9rTV9ipPmn7Dqi8oclWFU4f35ch2Nd9PNVtszt3ORa39p1Fv75jGVZL6bvFqTI
 CLw2ZitS2mYCt3iVQgrh6G9xfg2If1x/LAD7//OYAlHcpoBi2E9VM/P
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Fuelgauge blocks often are incorporated in bigger chip,
which may use only 1 line for interrupts. Shared-irq
handles that case by requesting irq as shared.

Maxim PMICs may include fuel gauge with additional features, which is
out of single Linux power supply driver scope.

For example, in max77705 PMIC fuelgauge has additional registers,
like IIN_REG, VSYS_REG, ISYS_REG. Those needed to measure PMIC input
current, system voltage and current respectively. Those measurements
cannot be bound to any of fuelgauge properties.

The solution here add and option to use max17042 driver as a MFD
sub device, thus allowing any additional functionality be implemented as
another sub device. This will help to reduce code duplication in MFD
fuel gauge drivers.

Make max17042 interrupt shared, and add platform driver
version.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v6:
- reformat commit messages
- add trailers
- Link to v5: https://lore.kernel.org/r/20241223-b4-max17042-v5-0-e4e409723bce@gmail.com

Changes in v5:
- platform version: use parent device of_node as current device.
  This is because mfd driver matches fuel gauge node, and max17042
  platform variant is intended to match a mfd subdevice.
- fix platform version issues.
- Link to v4: https://lore.kernel.org/r/20241108-b4-max17042-v4-0-87c6d99b3d3d@gmail.com

Changes in v4:
- review fixes.
- Link to v3: https://lore.kernel.org/r/20241118-b4-max17042-v3-0-9bcaeda42a06@gmail.com

Changes in v3:
- pass dev pointer to probe
- Link to v2: https://lore.kernel.org/r/20241108-b4-max17042-v2-0-f058f7a16bab@gmail.com

Changes in v2:
- drop NACKed commits
- make shared interrupts unconditionally
- rework descriptions
- add platform driver version
- Link to v1: https://lore.kernel.org/r/20241109-b4-max17042-v1-0-9e2b07e54e76@gmail.com

---
Dzmitry Sankouski (2):
      power: supply: max17042: make interrupt shared
      power: supply: max17042: add platform driver variant

 drivers/power/supply/max17042_battery.c | 200 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------
 1 file changed, 142 insertions(+), 58 deletions(-)
---
base-commit: 7b4b9bf203da94fbeac75ed3116c84aa03e74578
change-id: 20241108-b4-max17042-9306fc75afae

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>

