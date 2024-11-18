Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB51192B89
	for <imx@lists.linux.dev>; Mon, 18 Nov 2024 10:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731924603; cv=none; b=FpnyNn4+G+95WOudmdMH+RjFtv1mn6tFWdWYZHeogg2hBU1bcQ8CmhDgXUHaaDXRZlm9tI0/m0mtmr+i/3XqBKHTTpR1bvBLL/4w1CV+DvkpxiwEo7iEveD0rWCbzh6SsfDDtE6KKkqG/7sAM8ewBXGihZeP9gfVe7wY8Fogyu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731924603; c=relaxed/simple;
	bh=OL7qRLSxG0s/rBjQDcTGXS3wtyvq3ca7DYri+vMk6u4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rRIHpAqAhqK36lCLkPxFQ4o1LWeQeEEEHcVBegiJX32ickI/TbwTgT1QCOCm/MOX2301oSt3rPzWbaVmRZIUXOyR5w51ecfFopM7hz4sisCVmJOizh+vxkz+xcdDBK4b0FbW6U9Et8iO7Ftkm26D0mqdHDz+yGjzO6PzzUKS5TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbiO0Kdk; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbiO0Kdk"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9ed7d8c86cso592126766b.2
        for <imx@lists.linux.dev>; Mon, 18 Nov 2024 02:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731924600; x=1732529400; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TAawXV2Pa4jygEr1LKjVR7SSwvft3mACK3InAoqSWHI=;
        b=RbiO0KdkZtiefKyAn9fCoi0AW0OSyASbeQhsdlcMGaqWgWB75njUd6H7K/0LdrzaY+
         W79k5NTAEw6/SCCX1SJ8nTtQAC68dJfXZR69fPZrSgVGjYclfVdbM0B4ljei0EXoMJKL
         hLRzRedhYyBRoWmvllBqipaXjrjkDzX4c29nJrld2EHdxtylcZKi9D1ncU9LYGvIzEJI
         sdc0CvPtp9ZDW5aIfCsN0BHafeDWjbiZ1+XkwKSgSj6TeulaUjPYKErCt41Jg4PCmyCE
         /BREYd4jQobx98tSjymfEFdJXgaz9GYfXrjR79P8O4yJd5xo874Yi/qutbWoTugc3+EE
         khAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731924600; x=1732529400;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TAawXV2Pa4jygEr1LKjVR7SSwvft3mACK3InAoqSWHI=;
        b=I/VOyJlvBIok5GPcnaWVWdqoAsRBqzOSQFvG35Leal9qZ1G3jJEgzQzdfmt4iCsPSa
         lctp0reYBp84n7+ZuHR6sELdE0xiFghouY68YRmTXXASUwR45nGqcTKBs/7leXVXyanu
         09XOaPLpPo8NuJEQR0jCyx9mQGCTYfggXbv9MZpgD3gukGnqU7UYgTgeRsPZ5vU5UHSr
         jaIRj83G4jV1F/mWWhoUxMEepz/UiRq2cviyAoASDrhniJZ2bxB8UxkdmfyfkoZyf/R6
         9i1Fe3bBbqLNVGWl5rC8PjM5qpiFonboRHjOOoWG/SDGpiU33RpM+SOziD+AnFMt9Az1
         C/nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBOCtWGDY2U37xkJlNONnvDO8IwAE8OGHlzdT5jAWO9a3jSiFrU1yfjMRVogBzX40yIWw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHmU3G0ckhQZoqKiP+37Tr8jFZ1DybeCkylEqdQBep+PfIR+bm
	dumuHz+Kijc5kDQ+rLhzaHfZoekZl1YsNwqavZpH4E5cSQlcaefC
X-Google-Smtp-Source: AGHT+IEV887fK4x/zoQ5oGZPDlKSshxiegqGbDkMZtPnNY8t6w/dixHiVJbN2cH6q6ldqdSmIyhyEw==
X-Received: by 2002:a17:906:dc8f:b0:a9a:3e33:8d9e with SMTP id a640c23a62f3a-aa48344ea5dmr1000913666b.28.1731924599829;
        Mon, 18 Nov 2024 02:09:59 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa20e046932sm518546366b.170.2024.11.18.02.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 02:09:59 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v3 0/2] power: supply: max17042: cleanup and more features
Date: Mon, 18 Nov 2024 13:09:52 +0300
Message-Id: <20241118-b4-max17042-v3-0-9bcaeda42a06@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHESO2cC/1WOywqDMBBFf0Vm3ZRJjEa76n+ULhI70UB9kJRgE
 f+9USjo8lw4h7tAIO8owC1bwFN0wY1DgvySQdPpoSXmXolBoJCcY8WMZL2euUIpWJ1jaRtVaKs
 JkjF5sm7ea49n4s6Fz+i/ezzybf136lMncoasJmFQUSFJlfe21+59bcYetk4UR/f8IYrkWiwqq
 zQvjTZHd13XH+7E4pfiAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731924598; l=1807;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=OL7qRLSxG0s/rBjQDcTGXS3wtyvq3ca7DYri+vMk6u4=;
 b=7jEvmdQJh8PUUcsHhePFwT0jY9Q7oH7hRJfOSJ5ZhmxOfSk4LVTGVseM/tab168KyDJjGuEed
 k65kLp7lcysAceAGTYo5Hq9iJlKoLIzaeBx9AQ5SHr4LoG3fom71zkS
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

 drivers/power/supply/max17042_battery.c | 123 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------------------
 1 file changed, 91 insertions(+), 32 deletions(-)
---
base-commit: ae58226b89ac0cffa05ba7357733776542e40216
change-id: 20241108-b4-max17042-9306fc75afae

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>

