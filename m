Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6F63DEAC1
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 06:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787551910; cv=pass; b=rNNhMrOnGqq6E/EuhlHoDcfQP4ECoVS3eNl0jmhz+hGkPcyi4yXrdbInoG5OYS6eKMc/fFI2m/WTd54gvaQZQ+QxSBjKO2SKYYFj2SX+YFNF0hdyPDhy68hbaOiQHX3DjBOieNXjladBnBXQja3zgTic3uwiBWUVAjJFOp0Kx50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787551910; c=relaxed/simple;
	bh=upJbpfw5P/06Gk2CCXLh/97sXvHk+7trsmukUfr/kNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJ6e9A/D04bUJ0gOuCNsi6gAEldrL+THqzQNwhoIdam8v7ivq7BS/8AfITnTQU4wFYbMwuRR+FZxr/N7f1O/yGXwK4n667YI885sxOp2pXrI+42Mket6p8BMHQdYFvtyyOfsrifhYhxqYYckcVkE2+p95iaCF8FVe3pRvWWwG24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRd9ecq/; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRd9ecq/"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso2606205b3a.1
        for <imx@lists.linux.dev>; Sun, 23 Aug 2026 23:11:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787551908; cv=none;
        d=google.com; s=arc-20260327;
        b=JjoqnxWzoe2AM3mgxuqH3qLbqaogku+h1IVYqkPHhFLWJC6uhv71KKflO3BV2+4XWZ
         JN6cVAJ0FjpzKeQV6EZ7Zf7c1kki0e2e9N7yge6HKK2F48zvhrtZHRI6blgdxZJOMsjj
         nCRsDQaaDaDM1OwsQB03idUt+aEoyFCQNpJNr7W5ykyzL+hUsdMqC85LYFOPc1xuDBZa
         t8BP5Wzd2dADQlmDEqQW27w5oXXsOU/pk3yi5dY0UuU3RyX7B8Y9XhhQBvJU+lfgD6UX
         p/RVL+HqiVOv3LMzKCypMiFGKH3A3SGHBYzEAS5H1IE3bMckS9S/NjyyWl/9W+DHOptH
         N6ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=upJbpfw5P/06Gk2CCXLh/97sXvHk+7trsmukUfr/kNY=;
        fh=LcgpHvf8Q9R5NlBSSEW9eNy+WcF5IoW3LDiZImP2iwU=;
        b=GdhTSpix8HLv+tCnkQfGyxr17B1AuwUuCLR2WAK1/EDwgNGaEMgWMW7RsX2rIkUUiN
         U9DtPvUf0ccU4u8VRyR9pJNplKNcZeRueDiwmAQUD9CBHshNc5otmD2PhukRHa0FGu6o
         o9lAEPkoa/R83YqZv0Dqjv9ajzEgYHGiE68s0CDrZcCohtPOhXlxrbA7JHPWZAA7XUnO
         +b+IO7iSQx9ExSMtva63ZRI+9p+B+KNddjeoxsoc2wESQ++lg7xqw/NluYqW7y6inumb
         f4VjfzSNPnKN+ccGVsFkAcAD/iL9L/lqG6d3jfNpNJn5tW22MlPTEY/bR9u1+4tJjIUQ
         yqIw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787551908; x=1788156708; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upJbpfw5P/06Gk2CCXLh/97sXvHk+7trsmukUfr/kNY=;
        b=fRd9ecq/2RXhxMzJwu3NNMkwC5TMMJgguaNBcIU6xtylLeN7RkNp77gT08ZYVKy3ge
         3N18bR6A4JHPo49at0nnjlUdbxRrH8+gZJPiUYLxcENU4XjWm3F3BqSygf6ix5GtyeT6
         FnRUi1UFS4LXx1AG4NpQ0Z/CyN5rAbP7WvV4xdM2XHLtgXawRbfNyta03rDTYbIeUGWm
         h4mY0XsK6CdRNrkR6IQXlOfDe2pIXQGTlTAZWIxpA5Qc46zOTYdrmSW1xB0cAuagS7Nl
         zRPd/qf3cr8vPIKyZ2nPegmPL8z77GiVjEl1PMt0YBqHu1AJwBA2AsT203CMqCdyfXO5
         huKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787551908; x=1788156708;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=upJbpfw5P/06Gk2CCXLh/97sXvHk+7trsmukUfr/kNY=;
        b=BgswdV5Hd7auHhoJ0OECna3lPvTsVROr4mPp5nVPMz3FsaIGlfRUB8nfamDliECTmb
         4ZfGNEKaLtFapLkEnLQ4jNNTW4ETX9I0MASNLv8UQ5aqWSOWrmxJkZBwHBDj98CNP2NE
         FrI/UTUMeIEd1p1Uh07m9L8nA5G8hKXKnnPgkYQkoLvvHC1vM5BogGXL6Feab5wh6N/j
         /Cnut5TkkgWYiNijIXNrcvif6+azVLb1j/JVChxFZ1RTwlxoLg59EmjW0cTbydmCKiry
         2I+jiIZ8pKabUdge3riLTmhRJ22/WCNHeUuiGNDV2qZ1UEdsP7YjM2xTr4abztvspHUr
         ARuQ==
X-Gm-Message-State: AFuF++nM09O1PPr8NrKeqIVP4CyHdfqUrJRQ6lMemuv0CSbc/cEqIyUE
	KhQvN4NTFJKixeEEEmMfpSHEGwkGFQUQwdcn6EZVnfQ2h6Ew54zVd+S3EfQU3EwtBpQejQYGQvz
	tf2Y0dknckwZHxF6XkJiuxfEAOI59MihCk0a/
X-Gm-Gg: AR+sD13UBVWZWc35B8uW1qs0xAhNMJtlhnh51gxIZiEwHUVYHPNnnjRvskAaEs9mCap
	ttX8dTr+MhtFDas94ErzpsNdKELw0BqkAa6gBY44b0CewGJRRTEeTTly0yQlWZGwMSmWveFPHjY
	y713Xs6OL8loxcPhr5MUMr58Vkxt1ZxWau3nwZIIFcPRVYsH2lxA5rqTUmC3Ogf86Y5CrRhnqa8
	4BRJ/U8cGEBiZ8KBVOiqjeJ9E87LM2G9NNVLN5mgGD1IfWaSUSIhj6ZkaIUi7SEZt0/Nm8H3OiZ
	3yxV2pKtUal501j6Eia5c776x/6wjAvK2EOfrnryp9crDNicnSGUeBUvZ5FOwVMkOBJNLfyHm+j
	Jx3OmYIVv6JfkO/6gh3SdpVUmwJHMf6pMxp679w3RA4akflP8exTNV2lv
X-Received: by 2002:a05:6a00:178c:b0:848:52bf:4296 with SMTP id
 d2e1a72fcca58-851dfa76f9amr31661331b3a.15.1787551908090; Sun, 23 Aug 2026
 23:11:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260820111416.97917-1-phucduc.bui@gmail.com> <20260821111442.BAAED1F00A3A@smtp.kernel.org>
In-Reply-To: <20260821111442.BAAED1F00A3A@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 24 Aug 2026 13:11:35 +0700
X-Gm-Features: AcwNN1UUehHIBiUS3udMQDSoIp88Cr9UdchE0iBxwkX45M9_ARcsKGBtlwkKhwM
Message-ID: <CAABR9nFtcX4_Zx+kcDFMDb_Mj2LeAnp-948VDbGrkrrpwBHxNQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] net: fec: Propagate PTP initialization errors
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> New issues:
> - [Medium] `fec_ptp_init()` incorrectly returns 0 (success) instead of propagating the actual error code when `ptp_clock_register()` fails.
>

The ptp_clock_register() error handling issue will be addressed when I
resend the patch to net-next after August 31.


> Pre-existing issues:
> - [High] Concurrent execution of the PPS interrupt handler and device teardown causes a use-after-free on `fep->ptp_clock`.
> --
>

This series fixes the error path when devm_request_irq() fails by
propagating the error to the probe function.
The reported race between the PPS interrupt handler and device
teardown is a pre-existing issue and is unrelated to
the error propagation changes in this series.
I would like to leave this issue out of the current series.
