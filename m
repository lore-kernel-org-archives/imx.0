Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581A415539A
	for <imx@lists.linux.dev>; Tue, 23 Sep 2025 05:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758604949; cv=none; b=D9qcQascpIEwfXpzCF9Vl5uA4CYCLWhlkc3djBeadBbRwBpTtHmF0pgkjO0LWXrXH8VgHlKsxaV8Qvv9AYyLQ0vw4B4gQRx/MjlwjMfVzOpfuE9LO+oWn5J+EmMYCaHsEKD5jrGxBPiYSnmVBXSSPAmWhZmKaZEk3laOLL9iVGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758604949; c=relaxed/simple;
	bh=lGHX5iqtB9RFLRtL8dGgqDLJYcyVFasgYEy9aB83oIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdFeYChYD7S3gBqGpw0T2jeZShk4pnRSD4gWkGqGixCJZsByhAbwtmso3qcyOWmBXmHSP7Wivonfgg5CQBth5rguxTciR7gagUI3rHKH0BOKyPlE3FtmeochKS42i8XH0YKozBoB9iZt7vW3pzw8SxiXDdRzJSNeIsM2pADMUd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ypgyo/q9; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ypgyo/q9"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-32df5cae0b1so5816854a91.2
        for <imx@lists.linux.dev>; Mon, 22 Sep 2025 22:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758604946; x=1759209746; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dmt/sXOh8gCfdLN/NRWF2le0DpBMuP58ZmmKHufhPw=;
        b=Ypgyo/q9gT6WRcbUtSsM/oUmdWltWlIJ1otzBUQXBdoxpHQGUvtrvjpmPlRaZ1cpHj
         WpHn2OxhWKaN8oU9PR+X/WEbvUNW/1hL3JAOclrRB59HX1rPsnEr58LH1yUeOOxzMErB
         jRVOchlZCJrpyS/kfvEdnFhLLeCf8x2O/7WFxT/6rV1LF50xW1m3378MMN7QC+E0XlmS
         snV5TufSckLFHJJ1SGpAWz/VpF4ACqDcVVk2Hxp9M6MzlmZn41Gx3f2QxY5PTVEYxeRP
         WkIF6RVQs6c6UU4ccvhG0tWtBdAgK+bHJgaGsTO3CvvA/BigSIvJxQhVlf5f3QdItEG8
         Ugxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758604946; x=1759209746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dmt/sXOh8gCfdLN/NRWF2le0DpBMuP58ZmmKHufhPw=;
        b=FN4P0hL4VXjec41YRHVxef/BfKEIK+Oy+p5Q2FC0kKgetSwFpJYQrfXtWMltRkLjgD
         0LlJCEq590eoYpTKXA908vcSvYHfdMtVSxgLZ6JZdvZExEWKy7VJWE9q7NzA1uujUxKG
         UEn4tx53DWA6nt7p+Yim23JZpVL6Ml47B90bDFFNXas2D3f8BigjfG7Coe1UYqd4xWj6
         6X/UOZZ18+5O2vhpQg92SHFp4h0tFTPFQk8jcAlD3eFeNve1bEiU+iHNN42tltXpuE8h
         4NPVEncH9cbChdoWdgH6E/RYMW+kM2gBAF2x6mKnEk5EumfR/WbCz8hjefA2NmaHCxHT
         74kw==
X-Forwarded-Encrypted: i=1; AJvYcCViVbjIJ9Dl6fYrtkhZji/Hf0SYgYSgd/nBs64PzMTMuMLV6S2BHjojCzEMhWq4mgLzoxc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8FUqU5y9NYhTTNYO9T+i8azMXZQt9udTLwCiOx5Dlt5uiLCvR
	kFo8uolTQgtg7U3bsbh1qBCUgpSvanzq/+nkeSfQBUKCpYIU1Xmc7+DZWEVUeJIWS8Av/nA6MDr
	9O90w89aMekIY7I1/jemQl8joUxcYCEE=
X-Gm-Gg: ASbGncvTABRLQlReVtStKk1XzBjDW1JfIsOYoB1KF00gCQ1WNtrP469zKP3u38u7U78
	HDr3UAuw4YrS0fZxG3nEzcFYHz6rO2vUO8KgCDk/l8+UrzIpLCrzb7MtGgDI/BenHmQEYxmLk2j
	4wW2ykShoKRUAQeOFf/LF/0a3SoUHYtSPpaLEQQ5mB7rDgBvHaER0AsinveUx2/SEJ+vvvx/kL7
	NexyJ0=
X-Google-Smtp-Source: AGHT+IHjWF0OdvwVEBZ2nx87jdr7LoutqHAGG2hOFlgZ3AbCfU9cADrnOPszTGryVxRnY5J5JPGYaDNmdz6D3L0+UhQ=
X-Received: by 2002:a17:90b:3d0b:b0:32e:18b2:5a45 with SMTP id
 98e67ed59e1d1-332a92decfcmr1741778a91.5.1758604946515; Mon, 22 Sep 2025
 22:22:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com> <20250920-imx_rproc_c2-v2-5-3351c4c96df5@nxp.com>
In-Reply-To: <20250920-imx_rproc_c2-v2-5-3351c4c96df5@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 23 Sep 2025 13:22:12 +0800
X-Gm-Features: AS18NWCk-cLOeEky62DrDgsGiwmbzQDyczljQVACaIeDqm4vgeh4qeeeuazbSbY
Message-ID: <CAA+D8APwkqsAEz=xgaZ9h_4NbFemMoACEJ=xXjVkGhd4mTxmEg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] MAINTAINERS: Add an entry for i.MX remoteproc driver
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 20, 2025 at 9:16=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> Add an entry for the i.MX remoteproc driver
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Acked-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Best regards
Shengjiu wang
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index df319f9762b369a2746ee7f41334be9b57e7bf9b..c25aad1ad4386623065058d1a=
7cf92e1555ec7fe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18508,6 +18508,15 @@ F:     Documentation/devicetree/bindings/clock/*=
imx*
>  F:     drivers/clk/imx/
>  F:     include/dt-bindings/clock/*imx*
>
> +NXP i.MX REMOTEPROC DRIVERS
> +M:     Peng Fan <peng.fan@nxp.com>
> +M:     Daniel Baluta <daniel.baluta@nxp.com>
> +M:     Shengjiu Wang <shengjiu.wang@nxp.com>
> +L:     linux-remoteproc@vger.kernel.org
> +L:     imx@lists.linux.dev
> +S:     Maintained
> +F:     drivers/remoteproc/imx*
> +
>  NXP NETC TIMER PTP CLOCK DRIVER
>  M:     Wei Fang <wei.fang@nxp.com>
>  M:     Clark Wang <xiaoning.wang@nxp.com>
>
> --
> 2.37.1
>
>
