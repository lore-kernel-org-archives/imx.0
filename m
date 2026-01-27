Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B633535B14C
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 14:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524073; cv=pass; b=sOuYMPHJw0y6FgyglpUQQvugqM4b9dpIWLbQgvHg+WlNT0dVKNgrVQU0n1IHUQYQUan9prtPnqsebVwggAECNI8WBYP78kV94o1wTDhsVI4xGIy3Jxsxubk1TmBc3M0Hh716PbcNnfENj1HE0+ct9u6vTc9S8jp6S/iXb7pcvcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524073; c=relaxed/simple;
	bh=+6hira2PqCv4Dp6+TEfz3Cq4R6dRyt8LBQxDtVxSs/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7QWqXaa8K/Hxaxqc0C7ID5DH+IxfM4nG0eA3/7IonPQHvZf/12qjD+lwCqsXauHxxnx6HKHqCaW2tuKkH58RxO5qgeATVzDAfECCqNEndfkY2uC3sI2F0gEkvKqgAC6kL52FX8nlHmPLFeT73cHQSMBaxS66OAmJiF4qwYCLmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qdn6mre1; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qdn6mre1"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59dcd9b89ecso7152350e87.1
        for <imx@lists.linux.dev>; Tue, 27 Jan 2026 06:27:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769524070; cv=none;
        d=google.com; s=arc-20240605;
        b=PLNb06sUtfEqlaEhbSbLtwyAhZq0wrRbEzv/1nrK1HSwOwiMbtCJTJmqLNR6/TpulR
         HBV9JJjUDne++Mtomi3mvugePI+xN2ZhbVSwmuMajtO6gTWY2NtiUTQYhjDF6Cok3ZuB
         rZOVJRCTInKNxi63bSmzPKSQLzQCiZE0t19gm9vJJWNTwJcKcBvEtxsQcG41DHu07bD4
         7S+AmiOvYDe1SgYh3iyqjxeS7/O0w2GbOG9J1PdHZZKsUePc3VDWAqmYvGWC8pIDdDbX
         woaQXeq5UDhKnMxjj0FR2tv0jFATtxZjNJdw6SCPawVkFSbP8yicqsHNHRes7cKhV/sC
         fXyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1B+ZgAK0ulFf8Rg/ERS29Nw9Z/V30A92LHGwn+CwqEs=;
        fh=fR4u8lmQEK7Q38cGwoNTB2hAa/UivuB96OyKRhatKfY=;
        b=g4stinEysuYT0K6KW/AkifTkPj7rHpy2wZZQmvI6ergZrvJSHHnVaqNFmj0zEZkw6N
         skaSblg2qVKWbavWkMyiWvwQjTUQr6Welwfqwt8byA5nvl+b7cxBDmvillxAM6XsjXja
         PJWr//8ExfNEgayLzkXa96fLqfzKGX1zKgsKGEe1ne91z5mE05DOVZWJXabethPwgkAS
         DJHeKYvwxKJfYQbUT3IelR2hjXTPEirEfIpb40/5Ju/RmsCU2gALBeuQv2vlOOx5DeGw
         i6WsKXLxhpm9AgrvKIVmpgc4HqTDtMFz+Dm14bPvgmnQWFQovdsSUxF/Dfbitvf9/Nyf
         1+yQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769524070; x=1770128870; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1B+ZgAK0ulFf8Rg/ERS29Nw9Z/V30A92LHGwn+CwqEs=;
        b=Qdn6mre11RrmTx+lKAUgfSrUwFQykPbktt7L4nlkTdFRxweGEc14wG72OE0aGOXZOW
         6oQK3jj055YDWY/QMWBCn1FQITeEhBR3tEKYKu5xmYbVXI48jDaabKCtY3nG3y9kpIgf
         MzSKSEPbOMW+kt+cX/HkseBaN+aRdB0Sx6QmIOshAS696NzXyfTdG0aJPUOKXW5XQPzs
         uV4jScitL4SpESVCOSvolNU8v2wkin18WO0ZGy9weas00SAT9Xq5IxTiS58whHoVhBIy
         QdxDKuoHVZ3v6S1OZXIb9+iBA9xV/6kqaVYFVhV9ug1cc8fNm7mrz2E5wzLYLCJXBvDa
         nhrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769524070; x=1770128870;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1B+ZgAK0ulFf8Rg/ERS29Nw9Z/V30A92LHGwn+CwqEs=;
        b=gemDAq+uEGq/q2jub90PQ/hLdPeXucX8ahnbAX1QGbytVH7cMecbDo5OeqpNZ8LZYH
         9eTA2DcCeS66FH/SfkcAasryvAwaCWF0iqNNt2jM37Gxh+It5E5QGEooFdWdprxfcBS6
         zb2fZnGlYaqJso4QhIMzhssy1TOB/OKHzItTVMErPuLd2kHpa77XB5IbsOff8F/syT66
         uhzDKQgqZyvvcqfRg7tizZmw4ZB87Nlsyua/ycm6JKzPX+JG1K8MeAi3M9nmd3blwU6p
         WFSocDYkKKYgVJLj422TIxVOR6Krme7Ln8PwrrfE3msbWVP8+7vehcQuX+hQxrR3owxX
         5Dfw==
X-Forwarded-Encrypted: i=1; AJvYcCV+b3reWf4okxZ/IsGSkZr54e91Dl6FNBMwWn9ICmNwgrZ2gJBXnm37+C06sMilD3UGxhw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxCkZwx2i1ENNcMoJ+PRGcaN4EE2bPe+dxC5bXr12hqnVaua04J
	8RyFCdyTszrdwK0m9nJ7NRUswKiWOJIgAfsONBWprRsh/lpYJjud51VHuR0pQz/Bo/Q28o7M3V8
	ULdG+kJfNZLDJeTV1IUvUx1dOGbna7PwICTndsubX5g==
X-Gm-Gg: AZuq6aIfT4FfrsVQeEm12EuBNYbimdDi5+lzw1DWBBTYsAs6ak3V9ELFlG3ymrgNNhK
	o3P0RLDjEMHvLXBJlJeQ/jDvfDGDYsdVbvLygeqf2WnWVRFl6YryoMenDhGEWWdD3dx7gCu4XdO
	3Hp2l/t0jEXJXj3TWaLw4lRXHSimr437ij1O/4jlTlQTc5VlbLVmoHmxuY5LJrN9e+90cfu3Ovk
	vzFOm2aUIUTRhARGeN7idY+3rFrwTXWZVFifgQt3r4ITMpJmhUslIxiP9WAl33Y3tIxFeRz
X-Received: by 2002:a05:6512:234e:b0:59b:6a9c:530b with SMTP id
 2adb3069b0e04-59e04142c1bmr857103e87.26.1769524069786; Tue, 27 Jan 2026
 06:27:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260121-b4-scu-pd-v1-1-f993e4082089@gmail.com>
In-Reply-To: <20260121-b4-scu-pd-v1-1-f993e4082089@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 27 Jan 2026 15:27:13 +0100
X-Gm-Features: AZwV_QjMAX96nvdaiHP7TCZjGVMhp0ccF964SK-rZQQO1W4Cw8JdkkpQ3MeW438
Message-ID: <CAPDyKFr+USco=KMAnQWz8J_VkqftYwKFV9QtRN0vyc=ERJK8ew@mail.gmail.com>
Subject: Re: [PATCH] firmware: imx: scu-pd: Fix device_node reference leak in imx_sc_pd_get_console_rsrc()
To: Felix Gu <ustc.gu@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Jan 2026 at 15:17, Felix Gu <ustc.gu@gmail.com> wrote:
>
> When calling of_parse_phandle_with_args(), the caller is responsible
> to call of_node_put() to release the reference of device node.
> In imx_sc_pd_get_console_rsrc(), it does not release the reference.
>
> Fixes: 893cfb99734f ("firmware: imx: scu-pd: do not power off console domain")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Applied for next by amending the commit-msg-header, thanks!

Kind regards
Uffe



> ---
>  drivers/pmdomain/imx/scu-pd.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pmdomain/imx/scu-pd.c b/drivers/pmdomain/imx/scu-pd.c
> index 01d465d88f60..3ec33667a308 100644
> --- a/drivers/pmdomain/imx/scu-pd.c
> +++ b/drivers/pmdomain/imx/scu-pd.c
> @@ -326,6 +326,7 @@ static void imx_sc_pd_get_console_rsrc(void)
>                 return;
>
>         imx_con_rsrc = specs.args[0];
> +       of_node_put(specs.np);
>  }
>
>  static int imx_sc_get_pd_power(struct device *dev, u32 rsrc)
>
> ---
> base-commit: 053966c344dbd346e71305f530e91ea77916189f
> change-id: 20260121-b4-scu-pd-257a9a40e84e
>
> Best regards,
> --
> Felix Gu <ustc.gu@gmail.com>
>
