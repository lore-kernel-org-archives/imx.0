Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE6D2528F3
	for <imx@lists.linux.dev>; Wed, 19 Mar 2025 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742375512; cv=none; b=Wj6BGpIV1dLM+4yfPSNDhamK5dyiseo+L/BxyZmYeQcRgkgCp2cLqqJEhcIglAoNB60TGdI0ld+3ZqJJfu55LgDlQMgKypzcQBwUdA7BFTh8pTh5/K9LLHP9gt5k8kwbLcFOA4ROo/c6xkEliVUf+StK5gEPi1wseRcHEXa1PzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742375512; c=relaxed/simple;
	bh=RuprYZJqwe4KDAJjtW9yEAvrmNFaNz9njuDT/tdH7A4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=acxW38FNFIB5NzUnrumE00wbxRVKqEcnZtXuuJIdBJSESAfbmcAORr2P1HTESRgy8leK7zfmf7u1MYPz71ls/1V+dbQXJ3A/a7D2ApQJ61FcpPd8WtLvVcAJMyWhK0JEWf6MrZwObFLb6qkILHFcMIEEuJ5aOG0vz9Yx7tCjnlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWIa44bl; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWIa44bl"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso704140a91.0
        for <imx@lists.linux.dev>; Wed, 19 Mar 2025 02:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742375510; x=1742980310; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuprYZJqwe4KDAJjtW9yEAvrmNFaNz9njuDT/tdH7A4=;
        b=HWIa44blmCCcxFKQzC69O2PdTP8taqZMKMya6mZjMpNzX437v1n7iNqKaIpbsb8wXj
         xqeb//3cfXoS/5yRSbkEt+t7BZfkrLoz2wNopf8KALLlLcdNSqMHnz1ur7CoUTHocJP7
         2juyl6AmT0ELD/G3uzDTt7V/sRnOR3xcYs4ZuO0s48qamUKlMQbIiVumcVl3UQEYN5lZ
         tZZBopDdzsxvQcBmhFdivptQ1n4KVBLpQR1xDgkPzOEsY6J50SIbbQ1JkTR9M/tCm+MF
         dOdQASCfFzZWp1WwPlR5AkUkjek/30pBBv3b/qY5XzVHhJfg8LqlCjHB3aeD6O/hPODx
         0Vrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742375510; x=1742980310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuprYZJqwe4KDAJjtW9yEAvrmNFaNz9njuDT/tdH7A4=;
        b=gs7QCsmbNsY8li3JO47wQGUzuC0xrIImR+OJQJDIU2IvWCb2JXsZIhss1x5JgfJnYU
         m5HtTGT/26m/Z3xosYDIVCP4ZVimKKnDkejSm8nL1A2DWfK/LUyAXA2fO2+621YyYEUm
         IaJ3Xwd2LT0e8VJML6YCrVMNA7DPPV//lL6UU8ztYUSYWWsWWKiCRJvIwMNxZdAjKt7Q
         pe9C3hojfLieEs5wofDxBPdulR/ihkdkyQYZxaBBN3O/gPq+YFNCYXclRB0EdthF+6/m
         3WbO1MYdl2anWOAmnzdu1TK3l0UChUIBRCPSKgRCC+iQiP4oDpPQzPu+nVpwFdtXIjq1
         yfFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZoDcHCNVZcSulrQT5TBgPp1rD0h3wcpb00IT38xBPdkRt57QNyISQZD1U0RxfqK184I8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyxwkuWiyrxlcQXKNDjBOf5hZFoheNsebual55efJZKVxYfxaf9
	zg01schDyOiCBOmC0nEkDjlBbKfwPAT1/YRoKsdG2I1FXa/Nf5Gl5DEKTQVuZ4WMipdBzii8COp
	XtEhTvstxjUGL8cOJ7r6faokZ1fE=
X-Gm-Gg: ASbGncuyIVXzvDcv3t/8Lx5/LUMD0VzA8IQXowKp5FvAJXhpTWRBGyD78+/I/ew882i
	lVei1BirEkcPbdLcMhzrYJCLTQSagOp1Ema05KBVgBC+LaNl/jn/6lYu5F7cRQq0astJXaBi0GF
	7WwDDv3kdoWeGMSIUfjSzLESo=
X-Google-Smtp-Source: AGHT+IHulUmmhxYKpHLvuuCvhzTKveyDkVYVm3d6bzpsr+IdlsI0aty1tIfogVOy7fjTdFZHgdUItr+f8aeMDLV0DvU=
X-Received: by 2002:a17:90b:3c47:b0:2ff:4a8d:74f9 with SMTP id
 98e67ed59e1d1-301bda60f37mr3574753a91.10.1742375510218; Wed, 19 Mar 2025
 02:11:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250318215007.2109726-1-iuliana.prodan@oss.nxp.com>
In-Reply-To: <20250318215007.2109726-1-iuliana.prodan@oss.nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 19 Mar 2025 11:13:22 +0200
X-Gm-Features: AQ5f1JpoNZOhJi82lOgsg8paXpVn0pIptqVf5Y-45uL-Vvcne60Oe-MB2X2Chkk
Message-ID: <CAEnQRZCk042G01vfypi6SY3mR53kchHLYpHs_cg=sZ9vVyZFdQ@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: imx_dsp_rproc: Add support for
 DSP-specific features
To: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	"S.J. Wang" <shengjiu.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Mpuaudiosw <Mpuaudiosw@nxp.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, imx@lists.linux.dev, 
	linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 11:50=E2=80=AFPM Iuliana Prodan (OSS)
<iuliana.prodan@oss.nxp.com> wrote:
>
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
>
> Some DSP firmware requires a FW_READY signal before proceeding, while
> others do not.
> Therefore, add support to handle i.MX DSP-specific features.
>
> Implement handle_rsc callback to handle resource table parsing and to
> process DSP-specific resource, to determine if waiting is needed.
>
> Update imx_dsp_rproc_start() to handle this condition accordingly.
>
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
