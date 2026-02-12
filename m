Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8641A0712
	for <imx@lists.linux.dev>; Thu, 12 Feb 2026 19:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770925403; cv=pass; b=R85mhpVHDagJ2TXeLTeluwPvnryJnVYGpeIkRfx4mJ62iChrEgUE8/fcpg22K1k5o0f8/HsXy+7lXrUHXX/vqJIR4GPYoTFBOn7UZ7p9IPo0mfAlvvMM4hTCgMzEdjGjnHDP3F9Ocqo+T+JlEYpMt5gtPRA230qxo2KUeiuQwqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770925403; c=relaxed/simple;
	bh=Kpi8VTuPv12la3hlRcESDDvvbf16Gb36ZcVnMndVsyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mHI4MiszKqUJNJelmOls71E6zfiXgbyZbF5eFkgUHuiJWNkzAB17egyrpuCxbzlYl7ROGbYY9XmiuUkV61k1YHUXWLi+CLaba/JPNTCgau5nBJWLuf+IY5Nr80pDTEa1yv/PozNp6Y+qwGx3xwT4V02agGYmgPX68I86jhrGWmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjbQK9/F; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjbQK9/F"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-124a635476fso324866c88.0
        for <imx@lists.linux.dev>; Thu, 12 Feb 2026 11:43:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770925402; cv=none;
        d=google.com; s=arc-20240605;
        b=VP1PfX2wMu4FPFBfa+3xZ/rtu7vTkR+giDsrow1TK8ENWSCz2GHt2ileA4sOHjL6xu
         /9MN5oKaD155a3nFALkpkqHJ3snS9mIsf/OgiuNQ8odAe9W6uEVpKS1vIOLqW/JopM8c
         ksrPvKxNRnUB1KZ9oL/FAzigKRN4N7q3XFJG2t+kC583yM70C9iw6eg7ltggDT4AcYzo
         kiPH0ak9KMu53al1aQo/rLQYjLWx0rd8WraeWJDO8lBLR4UFjnESlLb6df4d6SPxPCAj
         Cfk4s8jJc4QJRrHH+DhYOKy6ZImEwd4dzkSHrEebnS4uzNgsOwwojGp0uGOjCEbaKjgz
         KKTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mpHRDkZlOYvBK1jMHMrk4jQz7fW7xddCyiPaMJKT8ts=;
        fh=ndmvC4cb0LB8EX0lZNT5TQSiTzdl85C+vkgW90eLegc=;
        b=OvMNfKfOVB+i1x1g9CrRHgL8ylqg+xz1g30V/lM0Unan/y2XLZuI6VpSWKbPf6aLXl
         d6TFMPQNvxjtIsDct1ftH/j9nzvOAxAPgjEsHHDDUtMzeHBLv3Pom2TYnHUEKH9e1DC0
         acwBG57pOJ4VszwirSndE4mG6lBojHdvunvFQyOMIbejuIO1HLTHMCqHooAW0yULF2cN
         /FjP7Nsc0b4rWrsNRQQNsrsN94VezlJ9eiq2nIiq0UpLzRe8lbDWCQu0+51BmCXUCSDK
         Hqv9VbQ1URM3wzH0xGi4wI9Yl9chFjaB4pCmlvsTCuz8MKnJjIwYcRQxaSQlJklmvKeI
         2izQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770925402; x=1771530202; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpHRDkZlOYvBK1jMHMrk4jQz7fW7xddCyiPaMJKT8ts=;
        b=BjbQK9/FzLPvSLvMIcrX/vPh3Vm/fH84fL0jE6tFZ/rgZpFQU/afEE2nA+kxXg86Cu
         oq7x9dnp/ixFPusXgxwEM9lExdFIgk45NuGLWBQmEtcuVIrc1EwyivfwJEBAI87nzHwK
         NKWIKax5s6++sLAS47oIDFWzeR4wArtYj4VpdbstvtYps7bDlcBZvf7t7CLR5xZybUVx
         S+SkwsBS0RESJ1dLi6eWx1L+Ff7LNFzfZagn/9vW+clvnva0fgnqUuF6rD195/14C0vo
         vdNB4idfFwuQPDsuZJK711t3QAae1RUvH0GpSWoCjYPSFw80s8W+8+s1GGP7DtgLcxPi
         jKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770925402; x=1771530202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mpHRDkZlOYvBK1jMHMrk4jQz7fW7xddCyiPaMJKT8ts=;
        b=J9PrGHYVjByaRkvI40rSGQ/8vnyt2s2Mg8ghtPby5Y1r5u+1h8Z8vY0Y2JQngfnZB7
         Pd67auGlaz4Ltir1V1+QUYGqTkwDnBS01ExOJ/lBp2C8e55owIyhfTxtHZtZIl6cuxK0
         7R7iXlSRrRkyR3rJK9lbYiSnvytzGbZ7Pf5ktDhb9qxtY4FAvudaPlif+HGeNxZxp8iw
         9TRKD4hBMXe1xktRjROtoAvRvldFdhKQIqqh0nFkqAjlFR6GLrKvWNkZiIsyjitFDWF2
         06c32I+ZHzjwSdKruas9sjzWlovBCNGi31lm54F5z2rffHtHIW/YjWXt6iesYLDcfmnB
         7p0w==
X-Forwarded-Encrypted: i=1; AJvYcCWDuyIceXKcSdtBEwF/MAI7Bxv596GriaFlixxpyK51+HTK5lflx5lNUno9VFWfbBYI86M=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYP5hWCp7MigAVNYQkRHcHcA1G+vdQCPWwegbQgj61OFwuOP6R
	7zuoqZk2ZxEWmLF7lHsRbtVaLkGoAnPjpflJL2FLp/9hrOGmS/Sj8XOQB/1xCxt+K9jd9fUe2/s
	JyfnwSZeH1GQ1mBfjQTye5WOdgz04uv0=
X-Gm-Gg: AZuq6aJfebxTGCHeBVoI/ExQWRLjZbArxn7erF36sVEuNc8VH1KqaB3UHwzjIPIZ2GG
	5CDKkX3yNXGG+k7wpEHHi5yz0tI1TFdazqp+UnsKMN0GmpgeDAICuUPmTUIJc8PyhQ4dDLn/Fp5
	WehOu9Up0znNzPNCTRoB+h34MKkqyDmMk7TCzmHyJglXZj5l0qx8qfCH/8r3uSf7uFcOwtTVu8G
	93oIQS2QlrLyZWR31ZCUymxfbeKxRbepgjZ4XCsv6v3WK2xbNCtvexO+sJmnJR/+XXCK2dPC4WR
	mPsKWo3Q5fVv8qrfNa0kIJlRdFxl/JlG7RqJXuw4Iezuyewl+6WUsVMgEBIJCI/HKXJ+8hxszNj
	I4/hVE0SDv0ncxLwBwaMgiA==
X-Received: by 2002:a05:7022:2218:b0:11b:9e5e:1a66 with SMTP id
 a92af1059eb24-127397b47a3mr48022c88.14.1770925401574; Thu, 12 Feb 2026
 11:43:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260211142321.55404-1-dakr@kernel.org> <10809444.nUPlyArG6x@steina-w>
 <9e33e5e5-76cd-4395-acb4-e2e03e436bf5@oss.nxp.com> <DGD5O31G6G9X.R8G6EBXXFKAH@kernel.org>
In-Reply-To: <DGD5O31G6G9X.R8G6EBXXFKAH@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 12 Feb 2026 21:43:07 +0200
X-Gm-Features: AZwV_Qi9zFnWs7AOJZOKq34_yl9qM1YaahPkhWTWEjwtIMb5KBMQENxC_CBtZ3Y
Message-ID: <CAEnQRZDMXhh-V6p6ovtmSTx2Gc2R8p=pHg8jOFgJ8i3TNNJT-g@mail.gmail.com>
Subject: Re: [PATCH] clk: scu/imx8qxp: do not register driver in probe()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Baluta <daniel.baluta@oss.nxp.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, abelvesa@kernel.org, peng.fan@nxp.com, 
	mturquette@baylibre.com, sboyd@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 7:22=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Wed Feb 11, 2026 at 3:59 PM CET, Daniel Baluta wrote:
> > On 2/11/26 16:43, Alexander Stein wrote:
> >> Am Mittwoch, 11. Februar 2026, 15:23:16 CET schrieb Danilo Krummrich:
> >>> +{
> >>> +   int ret;
> >>> +
> >>> +   ret =3D platform_driver_register(&imx8qxp_clk_driver);
> >>> +   if (ret)
> >>> +           return ret;
> >>> +
> >>> +   ret =3D imx_clk_scu_module_init();
> >>> +   if (ret)
> >>> +           platform_driver_unregister(&imx8qxp_clk_driver);
> >>> +
> >>> +   return ret;
> >>>
> > Also, because the logical flow is that CLK driver is uing SCU for calls=
 I would first call
> > imx_clk_scu_module_init and then register the imx8qxp_clk driver.
> >
> > But there is no functionality issues your your approach too, just a bet=
ter logical flow.
>
> I now remember why I kept it this way around. If we swap it we have to ca=
ll
> imx_clk_scu_module_exit() in the unwind path of imx8qxp_clk_init().
> Consequently, we'd have to drop __exit from imx_clk_scu_module_exit().
>
> Please let me know what you prefer.

I see. I prefer your initial implementation then maybe with an
explanation in the commit message.
