Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7D0466B5C
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 16:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751239; cv=none; b=ktt1/x00UceZ80PcmqDVtJUHTpXwxp7sOccd9JUHPcGkgl9//sGZJZWMaz+WUq47nTDzC8P1I8C7eBRV1ZJQ+41AgDo1+l46FljrwvXnTcvCYF4rsq+duPimuGUxtKCoLdA1qbm3pF0itB3HkOTa5haCvHWjqtzYBTQLEiOTCoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751239; c=relaxed/simple;
	bh=9UPYfhc/POTDHsxHKkd/qvgqQC6aTve2NNjdEdwkeQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3ZpJAn6OAN3cdxL7FpmO/H2hcj0DjI34ji3MKczPw5aXEdIYuWaPfhTwE6f2lxWgoGYNxFVwA/9z+gRFsk+FIzdiOFZbJtGpoqsPnT6E6XiBA5wDReM/0qa9ahTzgxTtnuNwF2osEjTZHvkW9WYO3ew9xTyd8xh5ETe8zntfCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHSGlKaG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHSGlKaG"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493a5d32e8cso18703885e9.1
        for <imx@lists.linux.dev>; Mon, 29 Jun 2026 09:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782751232; x=1783356032; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vTAqympCuHM2c/PQmqwHbJCuVDhybEJa0vtK+R7ZX2Q=;
        b=FHSGlKaGZtrYpbg8KEkRQnj2PdgXf1keZWJ8V+mEtRBsTIcUdZLJn8Crftky37HVmj
         a4iaEC7BPNhxUMN2NgjTEZiKdv5TGJXc20waVSCdhu8uacBcaSv3REgUBRKKOQlcPiuE
         TGqqeKVWTQy07ja1sNu8ssZhKd8d8QyEyp+dud9YFRA5DZiqocraZh2yDjUkLTymn8bk
         oYi4IhsqlpwWyB2Ffc/ThllWAxg0j4mbcAYxVMRGO3ED0w4AL/X49c96aCwphnRkcTQu
         0dJsFgPKfFOHhCg/FCV529EKBXRqiz+5iw+BNj4QL/7VWEMm4WeGU0yQy0B+tdYFheJZ
         Nejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782751232; x=1783356032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vTAqympCuHM2c/PQmqwHbJCuVDhybEJa0vtK+R7ZX2Q=;
        b=l6o7Jk13skiFit2N9idXuVYvhZVO+5I9gK7lDNppNDwIfTaUkzZN1Tj8hb+L7uSjmu
         SCO8YL4tG7iKRh1B/1X6pXHvgmpcooBgf27BPdPu/sa86fffsXqCoy+aBlPuobCQOVOn
         iu8OMhISMXILpGyXl1T3dPlb0xsv1y2R7rSAdjlke2mZMKAnT7yB1a8lwVFGJV2WhXjC
         cyhF5gq8yTZU2ULpNuoJARX4tci+PCWMxXm3Rj6iu5q6AI/IzAIWAZhrUp4m/lVOeo7s
         GO1QhTy+iayfQ+RPFjXGbPQkW0IWfP5Q69lLmkfnZMdzb6NEt9smqaKrWdKYw1ATgqzC
         KjrA==
X-Forwarded-Encrypted: i=1; AFNElJ8FiNZmF+OUKl33dCed4a8DZ8ZkPSH69wWD0k+52nVdkRE/GVvtQ0TfXKPbLsFzH/4nDoc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3x0mCHJ8mm+bpQjlVm6GKtKmclc85NLq2cTUz9E2rtjr+IVhh
	W6a6LV1qCAC+GyiwejOvshEFA/hE61nkuLRtpg+IrUgEcekMDULM/bSf
X-Gm-Gg: AfdE7cnYONzlmhpQrkOThSe8VOGQ9cK4dEmIXKYl8RjqPSn/5bkfLnPz4DfVVNkABs7
	8LGcj2lEHyT/StDB8z+hFx5UVCZ2f96e84uFX/AsLgVPOAb6PIIIvasF6Jc/9YI4TswVwCvKc/M
	xoi6HOxG4Kx4p3ri0bvcf431zuNNRRoTUF2eFLvb8O2ERfgtNkdSbGppNs01VidGk0oT0a8nToi
	oh26v6sRrq7XATZL3hSP/anVjFHxUuZplGyZU1Yzx6BE733wq7ufC3acVFj8tJzBBvRWXNe/Iid
	UKufU0KTpPdurJH7C8psEnq9G1c0wWScrEU90ATY9j4/tRYuEOdBrcyPnv7/cjwHvwPf+Y+mN54
	+GaAtibNuxVe9as/EZ5GMyHSan+wMKlpUW9hoH99TyPm0HGz9QZQ2nhhLzYxKBMnytbL4PikkhN
	KPHRsu2fJSFoVzCaFSEok6J7xtXuuai3F6HIiPcgH8yFmB0JFOlcJ9wVObMmX8+EdmJHaApQXJN
	xcNfl8Oh3aZVsxN9T4xhSQlXElhWYyb
X-Received: by 2002:a05:600c:1d09:b0:493:a535:5527 with SMTP id 5b1f17b1804b1-493b82ac8d4mr6429385e9.21.1782751231985;
        Mon, 29 Jun 2026 09:40:31 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b8c238fasm2254645e9.0.2026.06.29.09.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:40:31 -0700 (PDT)
Date: Mon, 29 Jun 2026 18:40:29 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v5 06/14] arm64: dts: imx8mp-var-som-symphony: enable PCIe
Message-ID: <akKf_akO7IZ2ltHd@Lord-Beerus.station>
References: <cover.1780929317.git.stefano.r@variscite.com>
 <26b5b602c3995a5a74f64b84576ab4d54ace23ee.1780929317.git.stefano.r@variscite.com>
 <akKdkWos2E25M_q8@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akKdkWos2E25M_q8@lizhi-Precision-Tower-5810>

Hi Frank,

On Mon, Jun 29, 2026 at 12:30:09PM -0400, Frank Li wrote:
> 
> You have to provide all clocks, otherwise, whole clocks and clock-names will
> by overwrite with one clock "ref".
> 
> suppose CHECK_DTBS should report warning about clocks items.
> 
> Frank
> 

thanks for checking.

In this case the SoC dtsi does not provide any clocks or clock-names for
the PCIe PHY node, so this is not overriding an existing clock list. It
only adds the external reference clock used by the board.

This follows the same pattern used by the i.MX8MP EVK, where the PCIe
PHY node only provides the external "ref" clock together with
fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>.

This is also why CHECK_DTBS does not report any warnings for this node.

$: sed -n '/^&pcie_phy {/,/^};/p' arch/arm64/boot/dts/freescale/imx8mp-evk.dts
&pcie_phy {
        fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
        clocks = <&pcie0_refclk>;
        clock-names = "ref";
        status = "okay";
};

Thanks,
Stefano
