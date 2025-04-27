Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56432522B0
	for <imx@lists.linux.dev>; Sun, 27 Apr 2025 11:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745755060; cv=none; b=l9hgdiTEnGbYcqDr0MSi7b6Pd+PmVIKc0ymozM6TL15AmC5Aq243VbwEUS/1y/OTtraDqu1XVODvkTHyXO1dddUGE/mZHjImYLETMNm3RfWBsAY0smQE5Nq5GvKjWQkOCo38/UuVdXmWjfjC2sv2UQHd6h3qL90Z8wi4/HATwjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745755060; c=relaxed/simple;
	bh=PBjPcyuMpEZLQB0/vy9bfQ0v8f/kjSCCYbtmIsssx3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P/+n6TbDyjckNm6Yq6Ro8wTpjps0ENfJ6lj5Zw7PLl5hCIWvhJB8kaJszLqkeiORIYRqWAhaqE5B6/rVLVdcTP4caVt/3I9ILhiBz8R45/rzepR6NmSSCtm3oKwtsnSmaScApgkFSchMJ0VDRQzlaOE+/4cl9/oxK9MSs+cgHJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xuXhAooZ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xuXhAooZ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-225477548e1so40819005ad.0
        for <imx@lists.linux.dev>; Sun, 27 Apr 2025 04:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745755058; x=1746359858; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RUGcbbLGFA1723YUU8ZP07EgO2qAswkxsFY9VKy3CQ=;
        b=xuXhAooZAqmEjKcLZszubkSCXd5U4HxQ7xwiPHfvkDCRyaF3J2LSWY8rkMVsVLtp0c
         HkwoU654ArI6NtoP9YbtUOAkav6bzpv/29BtIntfWrIn2x9MDh6m8EcbM51+FJqGuPdK
         lScoOq9BgMJnWztoGWfgEND22bj4HYJFrvaBKqPe6+tL1FcMn3f+s8l9D0gSM4T+4qoA
         a1YxaUJAot8ZCjMPNtzdbGaltzMgJTgX30F5qrC1OTjWZ0VqWAvTVGAwln+PQdGG1fTo
         ZP2Qp3cmbwWsXd6VcM2B1RE9iJf6fRq02NoXKP98ViL3/SR1o9ufk9FzBjWvlhAIRqJK
         OzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745755058; x=1746359858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RUGcbbLGFA1723YUU8ZP07EgO2qAswkxsFY9VKy3CQ=;
        b=XZxFi/uqntoiey4LAxyLIXB2Y9knpa2wKTfZ16K4u3JqiqgAsNxIcKdst+d8ZltzT9
         O0huHhGFfSbAA9CahBRPUaj9OFhzWZGR+w0T/58cRRLXahnjRTAzbcHau9FvjvxiTkox
         Yngh996D6bPc1ECU/DjmdqdDF4Bn5T9O5EffiDVDrAE0ZmldZitIVaCbUMgYDvw+nNok
         8bIb+9T83pU+hmxCVWzIv5ij4sowsx1JZJxkSlCsgVZDKZ0B5wHMMBGzVOTor35uDgLk
         fVD1b1BkQJWT8xrmUIUI2rlXcqqiXZr7JQSpkV0cH2a+FROSW/9uRYgYxVTWv67Lei5L
         nF7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWMapntus4gKJN/KEWOddZ/ZuzXH3br/hMF96KL5hZJtTiL3x0JmXHrXfvqXN89kPonEQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+RwvYalMDXqDVikzRP/HDNhJjOhoEhb++SmwkR1mXL9aDYB+o
	iTXeSwAj/qhwRuUr7iKEi1cw6EuJJwJYa6n5US8Nkh1pRknDfTfCxO0X2ndNkw==
X-Gm-Gg: ASbGnctABnl0ZLIp5my8XNoY0bgwJ686wCVanIUWozOCbDgUG+xTuWbYZX4NT5Xa06M
	9Jfyc2x70RMhBHUWB18FDqjW4eNLkqqjlN9H1u2FEzWNUFeMRgvHBcrIorvoYWAJlkeXuiroL51
	2jEETKmr3+yCICG0D2SwJucqQdodNqDgWukR0lTy0Q3aQWIUWHUN+Nx4KmWkl/T5F9R8o075XhW
	QUoN3CN7+MH4Tp/l/D2kExvEE43BgCozBsRiHMZ/3vjdbeS06z4sQDQTGyYI9Ka9nyW74Cb2rot
	5JSrl1qmO6bZMHURzd+3hjAY1TIHDaF4jEU4BELCVSEchuEk15XmlIo=
X-Google-Smtp-Source: AGHT+IF5v/6Ko/fvCwFf4ZE0KXGbwqh1gFSaF2rE1KE1z2Bwiq95JPxzfmr1/BPwNIqto7+dgvX58A==
X-Received: by 2002:a17:902:da8e:b0:225:b718:4dff with SMTP id d9443c01a7336-22dbf7487ffmr128283355ad.53.1745755057990;
        Sun, 27 Apr 2025 04:57:37 -0700 (PDT)
Received: from thinkpad.. ([120.60.143.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5103259sm62956035ad.185.2025.04.27.04.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 04:57:37 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Richard Zhu <hongxing.zhu@nxp.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v6 0/7] Add some enhancements for i.MX95 PCIe
Date: Sun, 27 Apr 2025 17:27:28 +0530
Message-ID: <174575498081.15979.12453799870165824890.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416081314.3929794-1-hongxing.zhu@nxp.com>
References: <20250416081314.3929794-1-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Apr 2025 16:13:07 +0800, Richard Zhu wrote:
> Add some enhancements for i.MX95 PCIe.
> - Refine the link procedure to speed up link training.
> - Add two ERRATA SW workarounds.
> - To align PHY's power on sequency, add COLD reset.
> - Add PLL clock lock check.
> - Save/retore the LUT table in supend/resume callbacks.
> - 3/7 relies on "arm64: dts: imx95: Correct the range of PCIe app-reg region"
>   https://lore.kernel.org/imx/20250314060104.390065-1-hongxing.zhu@nxp.com/
> 
> [...]

Applied, thanks!

[1/7] PCI: imx6: Start link directly when workaround is not required
      commit: 9c03e30e3ade32136fed5a4ab7872dcb205687d3
[2/7] PCI: imx6: Skip one dw_pcie_wait_for_link() in workaround link training
      commit: 4a4be0c088e3029a482ef8ac98bb2acb94af960e
[3/7] PCI: imx6: Toggle the cold reset for i.MX95 PCIe
      commit: 47f54a902dcd3b756e8e761f2c4c742af57dfff0
[4/7] PCI: imx6: Workaround i.MX95 PCIe may not exit L23 ready
      commit: ce0c43e855c7f652b6351110aaaabf9b521debd7
[5/7] PCI: imx6: Let i.MX95 PCIe compliance with 8GT/s Receiver Impedance ECN
      commit: 744a1c20ce933dcaca0f161fe7da115902a2f343
[6/7] PCI: imx6: Add PLL clock lock check for i.MX95 PCIe
      commit: 047e8b6b3bc3e6b25bfa12896a39d9fb82b591be
[7/7] PCI: imx6: Save and restore the LUT setting for i.MX95 PCIe
      commit: e4d66131caaf18d7c3c69914513f4be0519ddaaf

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
