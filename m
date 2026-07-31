Received: from mail-ej2-f3.google.com (mail-ej2-f3.google.com [74.125.228.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6960243C045
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 15:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785511652; cv=none; b=Xmm9v0vPDiFF+m19WOz/+lR50dcZ2udhwai4Zdx9I1zMwZJkJzidnlb4oKplB1cOnlEdZaPrfVi8A83BVnYpz0f2GrCXAia+W7Y3VhQRiy6nfslPgUILaR7Urvb6XwexA2RC7mclsgbbR4IVgGGla7PJXk+kRBwuCcrP/uuAYeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785511652; c=relaxed/simple;
	bh=2HCELcOA3DJNbDsYTukshelLlc3dZazcD3VSOVDcQgU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=i+k8704Fp+SC7uVmGNskBV4j6xS7nYH6FvPilDygNVSp17j40+WrRy92TJircoFipR5IqWzCRDeBAMUrAOrfx789U5RKIAbJtO/UtQ4jSrr0TADnfSU9rL63b922R6/z1K/x/fT+QhL2eoAB7YDWCemXpw1AD8XKUqXhQ29jNzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=RJGi5CCU; arc=none smtp.client-ip=74.125.228.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="RJGi5CCU"
Received: by mail-ej2-f3.google.com with SMTP id a640c23a62f3a-c15e9a2f51aso57071866b.0
        for <imx@lists.linux.dev>; Fri, 31 Jul 2026 08:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785511648; x=1786116448; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aaecu9LLR4tlERpL5fMxh+H29z5ZLQOadDtlIB8YJrI=;
        b=RJGi5CCUnrvhctKSycX7BH/pyPAJmwxy7u3wQaJhHjThAVSA8NLoUUGY+xn3vV1R9p
         h/uUxdNttst9HlJ+MxtSRr1XgskxM4MXKm8CGp25W1zHCiBk9wrmQnzJ1lPF0PgwDEN0
         Bdve4wo+2MTry9804gLPS9Rwmu6t9DWL0Sh2VJQKOfNb6Fhcdbhb5DZYVniXbqXrRinW
         cyuPOJk3uHhr6aTKro3MghbrY0/jhtABMRMxPH02r+WgTwI7vUnTc7H/cNfvVH7vTnmj
         hT351bRTOxJbLeJ30XYGslm5HV7BeMhmEzclmg/ndKrDdMKLhxCp8PpPm1OG/aHoMaPJ
         WXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785511648; x=1786116448;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aaecu9LLR4tlERpL5fMxh+H29z5ZLQOadDtlIB8YJrI=;
        b=VM/wsTmbYUMCXRnrSFhrzN/qxfWW0OkQGpFNnps1/K/aRjt1eohvqeSs535FK6I5j8
         I4AOsk6k8dOaoCIwSGhj4Lq/6dKrhaNQW3Ed5SKzTQ24PBnWFaPV5C9Fw/Gw3VjoMFCe
         hDTHbXBuQ+I7yetU1p8igs06zONjHJrclXkHTjbYkxs0pjfCCelJlJ+/E+TOD8STFedx
         gCPrWNdseQ88U3zTJVqSukKQt1C9k0GZH5oDEX8tkp/ArgRHo8Ij8S+qQ7pomJE3qRx2
         7G+kGm4pFrT0SELGV0Cc2l1fNCfMmUSUKpLoJaobJi2gbnH97ppt2K9Ky1UQl7b/PPHc
         dZ/Q==
X-Forwarded-Encrypted: i=1; AHgh+RodZPCNpLTHQZhpvkGs8NWKNzG0bCg/qTvNiIs3u0EaMMUDf2FMmfh3ucqtabpWWEIBDIU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw12jJ7ojJke3g6s3k17WhfckHltIlswU8FQ1h0Xy9lujaq81gY
	ebz5UrHCbe2RsbvkxmK1G3eRZ4doZqm87/U8wusSBHm65qGqzYaOn7wDEhviB7MtlA==
X-Gm-Gg: AR+sD10q1Xs5MLAzRTlqYyB8JgfEtGIigFXcI0XPxZK9TXt887ruTtJiZpC6ShMMToQ
	2NFqYpCEIrPriURAvx8A6F8YYLPn2N9sFNEQbEVsFljxb1c65Mq3ACMhpLouOjgKJ8cZBReUIcf
	3DC3kEDf8NPc+r7gOd3MBZ8yC4zDP4FfvS3cEe9WAYQaLyCN5SepuuCw8JMQFUQsNyNQkiue/5r
	kvHX8NS4ojY+A4zxIf95VcG5NWg35IYVC5bbcOcZLOea/Gj1EfN4s91J6nTT7p6ZvzOPlS2+10a
	knUPzSCJeYi3DDCGZwWQSf9/n2KAZR57GnAcU2k4RhCuOXqrP/EDoZaiVL8qgm0J5H4lO4IadFk
	AJm5TU1rpwxn60VVbD55dZK56F1sPeEfVB0VSzg9T9PCclAZ3ffMeeZY0n1rCAedZd7cWeU3zU2
	1VycylOHI1vlZd+j+twVQXYdRidFJ0Gw++GAEdySTGgdp2v2jI3weynfBCPrGRCSeiEfeepQ==
X-Received: by 2002:a17:906:1d08:b0:c16:1df9:6eda with SMTP id a640c23a62f3a-c1fe83796femr347266b.49.1785511648121;
        Fri, 31 Jul 2026 08:27:28 -0700 (PDT)
Received: from localhost ([2a02:908:1578:7a40:eb03:fa54:642b:57ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd46836dcsm186119166b.63.2026.07.31.08.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 08:27:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 31 Jul 2026 17:27:27 +0200
Message-Id: <DKCV1YWVZSTC.I04OWIWKFTUV@9elements.com>
Subject: Re: [PATCH v2] PCI: imx6: Enable ASPM L1 only iff CLKREQ# is
 supported
From: "Michal Gorlas" <michal.gorlas@9elements.com>
To: <sashiko-reviews@lists.linux.dev>, "Michal Gorlas"
 <michal.gorlas@9elements.com>
Cc: <linux-pci@vger.kernel.org>, <imx@lists.linux.dev>,
 <Frank.Li@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260731-l1-conditional-imx-v2-1-6016ee9148b2@9elements.com>
 <20260731135449.7A3B51F00A3A@smtp.kernel.org>
In-Reply-To: <20260731135449.7A3B51F00A3A@smtp.kernel.org>

On Fri Jul 31, 2026 at 3:54 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] ASPM L1 is conditionally disabled at boot but unconditionally =
disabled upon resume, causing state inconsistency across power cycles.
> --
>
> --- Patch [1]: [PATCH v2] PCI: imx6: Enable ASPM L1 only iff CLKREQ# is s=
upported ---
> commit 7a899eb7e9f8116a0334832c7490e52f71ae751c
> Author: Michal Gorlas <michal.gorlas@9elements.com>
>
> PCI: imx6: Enable ASPM L1 only iff CLKREQ# is supported
>
> This commit conditionally disables ASPM L1 capabilities in the LNKCAP
> register if supports-clkreq is not set in the device tree. It also disabl=
es
> L1 during resume for platforms advertising IMX_PCIE_FLAG_BROKEN_SUSPEND.
>
> Link: https://patch.msgid.link/20260719-l1-conditional-imx-v1-1-a55a57915=
c68@9elements.com
>
>> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/control=
ler/dwc/pci-imx6.c
>> index 98e1db751132a..1fdcbcd2422e5 100644
>> --- a/drivers/pci/controller/dwc/pci-imx6.c
>> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> [ ... ]
>> @@ -1442,6 +1458,9 @@ static int imx_pcie_host_init(struct dw_pcie_rp *p=
p)
>> =20
>>  	imx_setup_phy_mpll(imx_pcie);
>> =20
>> +	if (!imx_pcie->supports_clkreq)
>> +		imx_pcie_disable_l1(pci);
>> +
>>  	return 0;
>> =20
>>  err_phy_off:
> [ ... ]
>> @@ -1748,6 +1767,7 @@ static int imx_pcie_resume_noirq(struct device *de=
v)
>>  			return ret;
>>  		imx_pcie_deassert_core_reset(imx_pcie);
>>  		imx_pcie_assert_perst(imx_pcie, false);
>> +		imx_pcie_disable_l1(imx_pcie->pci);
>
> [Severity: Medium]
> Will this cause an inconsistent ASPM L1 state across power cycles?
>
> During boot in imx_pcie_host_init(), imx_pcie_disable_l1() is only called=
 if
> imx_pcie->supports_clkreq is false. However, during resume here in
> imx_pcie_resume_noirq(), the L1 capability is disabled unconditionally fo=
r
> platforms with IMX_PCIE_FLAG_BROKEN_SUSPEND.
>
> If a platform has supports_clkreq set to true, it would retain the L1
> capability at boot, but lose it unconditionally after a suspend/resume cy=
cle.

Platforms that set IMX_PCIE_FLAG_BROKEN_SUSPEND (i.MX6Q) do not
set supports-clkreq in their DTs. So no, such scenario won't occur.
