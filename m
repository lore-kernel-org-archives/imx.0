Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F021837F741
	for <imx@lists.linux.dev>; Tue, 19 May 2026 06:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171426; cv=none; b=lT5ndDFWPNVJgOn9K/5MTcCRzfuGZal4f0TMYyOH0bxWh8Aq9ca6UwpnY4PieBqoAphQwnB8mkN83IdU9ucl6ZXDWplsv1hg8vILpN0swXKepUN7Q0M+s9cCpekxNeqo19pF7ZWMNakmn+cw9tyTAUpCQ+YApTfVEnz4vMXs9cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171426; c=relaxed/simple;
	bh=IRf66rMUn0EauExfU5hPO+7wssB+4ZO7/x8sY0FiJIk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B210NrsHUwFqABPgBMwUvSPGYGboE0veeLn0wJV6J8OPsLhTKsXGQNGoDyhBnOwlMBY0KmU89ia3de5YhKiBfyjL9CsNd1+iAWI0H4RQh3nhO6/rsKqapX+yrVxPoB8o4UQnZ6vVb6nBGwRU6pajBmbC7cENrcLqHKiIoeylvEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbSSRdJi; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbSSRdJi"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8367df48711so1278359b3a.1
        for <imx@lists.linux.dev>; Mon, 18 May 2026 23:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779171424; x=1779776224; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l4dJkPtRJlrakoxNtYsMbmeYzTOO5LSMpVcjFeyWMwk=;
        b=AbSSRdJiB6dnmFXs/X1Ug6Q1PUWc0NOq2VplifkgAT2MM2jOjmzSWSrmDHvuo0n4j9
         pWH/AVopd3MxX4zt/QiEEB0HoihVShNbeEo1bsNUoOmmZ1osxcJCe5tCjRiOg151fdbt
         y6abPT1jmj/1RvM58UD/4o09U5If8LsXHyGoOL+JlCkPxN+za68SNaJmpP3m1oX7yVk8
         cVRCUH3NOHZEwqQn1oJRBSd1Ic5GEm4af0E819Z9vnD+emoxcjDiPiAnAQRpwrCbmOTi
         Cw+y061C4Vcp3M9dzqs1uQYT0aS625ZsVfCfdpmhdnez4eLu4+3grQPKW4K9HOB1HYOA
         I2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779171424; x=1779776224;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4dJkPtRJlrakoxNtYsMbmeYzTOO5LSMpVcjFeyWMwk=;
        b=GNgkps6Y3xCQjoOeijN10Qs40d/P0ceq1iDc/NICVjGhjLwOSvch/ytIJh7kY6gD/E
         th/PT45B1GuSGghO5Ou5HY2ILWuLXtYtrdpfwiVwgqbrert72U5h2sWfm0Sid+vQohgg
         aCs0SJ0xBzikU3klY+pHGic7QCd93/4FBvLxsJqiAkt1hhUF7Dy7XUwMTAnju/EeF/4f
         Fgva6bdbiI/h9/9F5U+fELkao8M0fwu7XaRI23zb/Xt+l7vZNFkE7Q59WalPLf7VzMq3
         H02KqwUwAGC0NBJcOoqrtBV1ClXJQEvS6r7M2VwSqrT6AqvAjuryez9tQW/UtgoNNesx
         9ZBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/dUNQgxv76f+sxc4QyVxzaLtmYB/ZtZlVMKOsHyDhsbkeMdAL3i/DnFz96Clkucx04D88=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9qDikq6mNRhWhs6j853lsQTF/RDsVLd5B7NbafX9g6w5nFjrn
	4+ygcCZ0v0nAMQwN24QrzR4FX4BQy03aHGaUQJhOVJfQg3gSLNcUOH/b
X-Gm-Gg: Acq92OH7kDtcl/8pYaXliUx+LipWMmdvnmSL+IX927YVfM9G413idM3qKyilyBxyVeE
	ehPSAz8f7uLErqWRFMFRu33wJSd2myDSNq2AVmCK+l3wcBVPHUjYKI5fptNRCskYfdAuaNWr9xO
	OJrtgCrb5QpseUD6etm/Dg/bpeEo+ClXpXD2AnCS702RhLwGu1EdOdBA3YfR0OBygmropJfl81l
	QCmrtw+Sqhg3CL3wgZd8JsWfiM4V8GsDXEwn+seMyGDYXt5CRmi9aGKdfPxLClgU1ryAOkwu6z1
	f2gBShIJUtg1xU9rOX04gz9kKbKjNWxXnbbI0bhnP6TZA9hNn7LMDrYsYSAGV2dps+0aINMC0FY
	0xOkaS2jN8SCftBAX7Nzv2/xx/rBv9Xk5wEfcgqBvbNUnlQh8WbGm5CNo68CFjg6N3p3AO4hFLs
	TyH1rKHU4eSqd3pT8phMUqiItuZosbc02vElJ3rSG+
X-Received: by 2002:aa7:8882:0:b0:82a:6f69:7f72 with SMTP id d2e1a72fcca58-83f33f0fddcmr18309030b3a.47.1779171424126;
        Mon, 18 May 2026 23:17:04 -0700 (PDT)
Received: from [10.240.146.115] ([2.27.148.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7f202sm16112266b3a.43.2026.05.18.23.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:17:03 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Subject: [PATCH 0/3] spi: enable the SpacemiT K3 SoC QSPI
Date: Tue, 19 May 2026 14:15:54 +0800
Message-Id: <20260519-k3-pico-itx-qspi-v1-v1-0-c32afeeaf741@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvyJ7bkGtPPSV6BC21hKoaUgQ/j3pO
 AwzL2RKTBkm8UKiwpmDb6A6AfZY/U7IW2PQUhs5KoNnj5FtQL4fvHJkLAodyaFJbYfRQStjIsf
 Pf52XWj8cBcVXZQAAAA==
X-Change-ID: 20260516-k3-pico-itx-qspi-v1-fe040512c45f
To: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Zhengyu He <hezhy472013@gmail.com>, Cody Kang <cody.kang.hk@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1315; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=IRf66rMUn0EauExfU5hPO+7wssB+4ZO7/x8sY0FiJIk=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqDABSfcnC9ZjpkklceVU1Dc84Db35p/VpVrwwE
 QDGds/SgceJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCagwAUgAKCRDN9pw2gLgN
 2HqzD/0VAmqmljFG81AwhK9sHmx+W7G0+tQQEk/jObuf+VKS7IU2TNYECbcuBa/u6SMRj0B5R4v
 mas/Bvw0fsXZ8tUPIoblkQNY6illXhaf4Ptj+k/atW51oI7U/6A3o3Fm+3mypFodkn1bLzNoKXH
 SOuiD+fKWCg6LqOMKhkIGSwQ59akev0vQCKY3UV0u0fzC13IdjEFyVfadZ6pw1z8tYVQkPTmt0Y
 ryg3W44kH75nsUbpIEPp3gl35SpGNrK6eVAwUJn8rFryxFcIXiiyhNhvOQ6Szn5PtJrAcRJ/Vur
 fJwYIceLo3QSBxv9yFttP8SjD7Et9BFN2V9bC8htLx39j5Q53pqJWpfbW0/Ul1QuG+PNm92dbPD
 tliQeDh3FbQgvfX8HPO7Ca1c0AVh7+HolFliXHliJK13cDsN3rGTsljCdqtLJBjJ+wHtNsUk6/i
 qIFs2XgDOjBepZq2zwwndBURVG6gYRI7MBiqWPnraOjZgcJ083gVbxwiOXLlpf7unGoWDZ4C/ks
 INTULC98JS7VaoVJqBUGys8eIetJoB52S20S/JpxLCikDKkFXXh6hePzehXnIAYB0Hg1TxmIRvE
 295eKmyvRMfiX7X//ERs8MSS9yCA/sg222P5Haf5mgRz+O1AAsRCVwi6Y54Pn3fWg5QSV5Lqzrd
 PiBjAzVbs7knGjw==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959

This series adds support for the SpacemiT K3 SoC QSPI and enables
the SPI NOR flash on the K3 Pico-ITX board.

The K3 QSPI controller can be supported by the existing fsl-qspi
driver with K3-specific device type data.  The changes are:
  - Documenting the SpacemiT K3 QSPI compatible
  - Adding SpacemiT K3 device type data to the fsl-qspi driver
  - Enabling the QSPI controller and SPI NOR flash on K3 Pico-ITX

This series is available here:
  https://github.com/imguoguo/linux/tree/k3-pico-itx-qspi-v1

Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
---
Zhengyu He (3):
      spi: dt-bindings: fsl-qspi: support SpacemiT K3
      spi: fsl-qspi: add SpacemiT K3 support
      riscv: dts: spacemit: add QSPI support for K3 Pico-ITX

 .../devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml  |  5 +-
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       | 58 ++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi       | 21 ++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 16 ++++++
 drivers/spi/spi-fsl-qspi.c                         |  1 +
 5 files changed, 100 insertions(+), 1 deletion(-)
---
base-commit: 6916d5703ddf9a38f1f6c2cc793381a24ee914c6
change-id: 20260516-k3-pico-itx-qspi-v1-fe040512c45f

Best regards,
-- 
Zhengyu He <hezhy472013@gmail.com>

