Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285DB1A8C18
	for <imx@lists.linux.dev>; Thu, 20 Jun 2024 16:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718902401; cv=none; b=kv73od74kmse3MsTfmdWZk8oGaxXSqPcMUclun4/1gkuQYrH7hJVatibxvHDKAeu3Qsx8zl5xnUdi3+Cb1RGW37IjxYlAwv7FXzlBkXxBWqbg1JQ4oZC1NjTpr6Er2TrdYIQ8IFpYFZx3khgtW38mpuF6Gf9GWo6wHS7A5z7Nt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718902401; c=relaxed/simple;
	bh=7AmTvR060R3Xb4pZV+tbl305NBdOBTN3BeShU8bb3iM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tmZlClsbStZrcMXJlqClt75I6MSn8+0aCYJoTNjpfrlDTiDgpRVBD+3qoQ1rMS5WCGjkC+TlmhZYI3VN8u9e7LLzuZskHLQSvNcPyIqSDGOpBSCfM3ihwULse7YqjIC36YY/lZB5E7Gr9G5zUvW9zz+GdRUTlZfBYW7uPAAiRj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zxa735wq; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zxa735wq"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2c7cd2f077fso198505a91.2
        for <imx@lists.linux.dev>; Thu, 20 Jun 2024 09:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718902399; x=1719507199; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AmTvR060R3Xb4pZV+tbl305NBdOBTN3BeShU8bb3iM=;
        b=Zxa735wq8BNxBYPsrK6ZeCPo8JqH/2moLJAQp0Ta+oGd5zJHFM6rNlHtGds0I9dhm5
         N2zYBnFQMsX5MFrJITlYqB1uU8SgL6gLRb0hqr1TgpBPpenm3ebRATXXvInP5M/k1yJL
         QNRpegrBLM5VdR44uedi6CEEJ4LGXV3CQvjdDlMVSWT86DIkTPwH1K4Z0iYED00Db79i
         1jUkKDptetjFzTV2LeKlKRIwMnI+CioauBuhyiDDlZeAJiaUUWjn51B0/JSeOvTWJgG+
         fWpf4sqLBAVoB7IJej/P1CwTLogvE3DCY1QTFg3HI3ZgOs11JKOUXClJt+J8g0PWV0Lf
         qwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718902399; x=1719507199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7AmTvR060R3Xb4pZV+tbl305NBdOBTN3BeShU8bb3iM=;
        b=lUundJPys8sCSCwWQRvWzu2gKqWv0RSnj576fpjRiBDEW/vNb9ctLSONUiAQyI5FAH
         QkfzjI/VkJwU54sXx721X0cbQI4+B6HKQum65oxCPBvWL2MmqA+xM7bM+hfIDdtmj6Kx
         o+VNEj1QunXiL5t0LC55+7PFN2m2hAU3ptv/4aEh+Dfuk5uSzoytCA4/SqR9RpAM/6PY
         VOx903eGaQQBzAlbunWIZxTefaOxJs0x7IVZG7sGXul1VcQR0sDPLEp6Y5XuwFhvIasy
         D4+dsg+r0Vw0EtwWusd0vItBzNCasmR6lhjKFGL7WHmDYB8CI3hoAzb8Qn4seS2Ut6kf
         BJqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUraltToZBhkLe1YtUo5iJ51FfTuzT8MQQ6aUBOzqSeryvZ5mBRPObKayBynL51DT7tHiBh04HsZ36J8GlAZdIJ68cf
X-Gm-Message-State: AOJu0Yz7pLceMgw9RwM8+77I5zVku2s9Nzv8orK2BKfLZEkU/29iVomD
	pHy7icWYSqEYo9BvOhTZXVyg17bcFHfGeg5MdpQy60RnHxaF9p1Y5NxpcAbg5nyrYCQJZ1AmL5E
	MDIV2NRvElKR1XA3v7gpXdn0xeYg=
X-Google-Smtp-Source: AGHT+IF/WclI9nxVPYbvTRGt5Ozim4FmlJxWK0XFHHvagUIq2drNW2Tk+Lnvy0cKdMs9XBclyq0RBzh5sfTQdRGOXDg=
X-Received: by 2002:a05:6a20:a12b:b0:1b4:e10c:62bd with SMTP id
 adf61e73a8af0-1bcbb3fd1cdmr6155893637.2.1718902399386; Thu, 20 Jun 2024
 09:53:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1716962565-2084-1-git-send-email-hongxing.zhu@nxp.com>
 <1716962565-2084-3-git-send-email-hongxing.zhu@nxp.com> <2f15baba-68b5-4e99-bdb5-6d2e05b7688b@roeck-us.net>
In-Reply-To: <2f15baba-68b5-4e99-bdb5-6d2e05b7688b@roeck-us.net>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 20 Jun 2024 13:53:08 -0300
Message-ID: <CAOMZO5ApiFtRYB5gtzxQj53SLGu_64-J_owEt4MYzABM249qpw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] phy: freescale: imx8qm-hsio: Add i.MX8QM HSIO PHY
 driver support
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, conor@kernel.org, vkoul@kernel.org, 
	kishon@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	frank.li@nxp.com, conor+dt@kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 1:39=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:

> Building alpha:allmodconfig ... failed
> --------------
> Error log:
> drivers/phy/freescale/phy-fsl-imx8qm-hsio.c: In function 'imx_hsio_set_mo=
de':
> drivers/phy/freescale/phy-fsl-imx8qm-hsio.c:459:15: error: implicit decla=
ration of function 'FIELD_PREP'

Nathan sent a fix for it and Vinod applied:

https://lore.kernel.org/linux-phy/171890153156.219744.4144352903595964774.b=
4-ty@kernel.org/
