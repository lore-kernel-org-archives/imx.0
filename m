Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053CC22171E
	for <imx@lists.linux.dev>; Wed, 26 Feb 2025 14:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740581743; cv=none; b=Re5VMcFI7v6EFwoAjsQTwGYG0FL9sPMGKvHUhq11fO2wqOiTNARa+o15OEoyyNP4HG53W86YhD6VyrwsbtrXeEkEY/QSCTP/Dj639u+Fw4tudGgdiWib7j6xZjcp1xYN8Z/wwebgFEqiDVusnY0ENEN+rS2i44jV6yzSvywO1sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740581743; c=relaxed/simple;
	bh=kqe+6WP8zwuAM8lStwswFPaBIe7m1+DTxkz3F6unuCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVAL1NGPYylcy51VEB0Id9udYiAqgpY79q1XJtsCbpCmMJpx1rkWfxSsIHGeOxp55+vYIJfbAedaWAxeOhCjbW8zMexaR7J9U6MqCDBseSAeNZ408jjewx89dpHqIIPjR3goJqRWulg0EdhctlTWIb8Ip3DKvdGRibhVAYkMmN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-220bff984a0so147943245ad.3
        for <imx@lists.linux.dev>; Wed, 26 Feb 2025 06:55:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740581741; x=1741186541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qygdnn8/rGb3p7MtdeT/GcR8Vsv7irPMGDAbFAo9qWg=;
        b=uG5OZPVB35CKrnx0wKQo+1udkpfmw2MJiblkf+tcIXAhcaPNcYF+moAB5MPLeca8N+
         SIfZPaqy//4upHaeGx62VpYzaJReOoHobQ+AhBHneo53BrOZeFFf8TZEZjJsxy2L//cU
         0T86XHJmLanHhPIIjAHQhHSRElaTQcI8fzFcgNaVhSg+fgXjeogxeUQeP5NKqN57OoTC
         ctgV8NUKVPuwyzX/Wrnfe/gMl/GcuykDkL1vKZMm9ohMNdLgvHmAo1ByuRTb5yTDPeBp
         /04i28NRP3KqIJ9VV1ez113zlgCnZJbUdjeDEd0uzskSLzpIji3JCGprqRkCl0+b4gGA
         DpGg==
X-Forwarded-Encrypted: i=1; AJvYcCUB3N/hWSNXn7t61UdYe/MbEtKu2XVEKX6pBZnOMlKJlxXKAn1GlrlkVHi9jGpmENFnX/g=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFHl+TJuA3KOtylb2lEEP86tR+Oy7cjZB/N2tOkjOdBYAwqJsq
	91FMKYoYNLJX3Vr6xhLTQ2TIXQAkUcp6amhuDwNCHofDE4a64Dw1qeQGKMGbqiQ=
X-Gm-Gg: ASbGnctZjKJnTq/dwcP0muBDSLFrI+KMF0YJCrVPA13r/pc7hyD6BAPIcMSUdWlwDmy
	JAOQa/1BwQyCbUzkx3VXT/yvj1CBt98EiIcz3ViXCQ+uzjvO8IVI0pvq4OM0ogv1CY+EPtC/R2Y
	5Cv0K72oASiIZMctDyAFrxSzeGctCZH/ULIv/A0At6HXVksU/EIr6AechwUFFj2Ke/Wu/QOf1+m
	387Jld10dNd9HNQLUI1wkVHxCd0iHr/rs/n5Go6haWX1Cz8PA8FO+KkWSOgq4/wxifCJz/mtdov
	KJZmWSmrMVMFWySADUmKLqYLoev591W9WSjp8TJIYCAS+usBDgMHllBOIBRc
X-Google-Smtp-Source: AGHT+IHpReDZSPPm6VjjIZPy7MkI2n87DOyqv+KvtWFP7LuZsR9/Xzl8+SaiWZs9PmK6WFRJ4senxw==
X-Received: by 2002:a05:6a00:1709:b0:732:2967:400 with SMTP id d2e1a72fcca58-7347910977emr12444159b3a.12.1740581741225;
        Wed, 26 Feb 2025 06:55:41 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7347a6f761fsm3544593b3a.47.2025.02.26.06.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:55:40 -0800 (PST)
Date: Wed, 26 Feb 2025 23:55:39 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.li@nxp.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 1/3] dt-bindings: PCI: fsl,imx6q-pcie: Add optional DMA
 interrupt
Message-ID: <20250226145539.GA3691935@rocinante>
References: <20250225102726.654070-1-alexander.stein@ew.tq-group.com>
 <20250225102726.654070-2-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225102726.654070-2-alexander.stein@ew.tq-group.com>

Hello,

> i.MX8QM and i.MX8QXP/DXP have an additional interrupt for DMA.

Applied to dt-bindings, thank you!

	Krzysztof
