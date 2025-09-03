Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1299914A4CC
	for <imx@lists.linux.dev>; Wed,  3 Sep 2025 07:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756884002; cv=none; b=PkLARdqCKZ56XBVhi3l6SUpsBIIVbdknVSTsby4x/0q0ZoZ3iecKtCH+iX1JWEOhDfNBy+XSwJrKUptwnrtI8VS5F+buKWscGIbifwKkx7d3Tcwv9fgCZEscBsFchvK98oikumy5++LG9E6guV2wcjgjGmDgIH1KBV6yz/Ix8jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756884002; c=relaxed/simple;
	bh=En2W+hPUiVIc0l1BQLH8vAPb/+q7zcp7yOavO//Np4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J53mxx17ZCr/fubP31d8X29wc+8Z27QqalVcLt7BmVdAn/Ku+dWMvxnAJdtlojSvlvqdOUB/6DrekTnI96Ew2clHPzcdIhj3hj7b1YgHtmd9zVMeJFcAFlfF7qd+OKD0t40o1+6UGA2m84MPRLsIlUft/J5aS87YW++H/147cE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUbBgwx3; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUbBgwx3"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b4c6fee41c9so4764926a12.1
        for <imx@lists.linux.dev>; Wed, 03 Sep 2025 00:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756884000; x=1757488800; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=En2W+hPUiVIc0l1BQLH8vAPb/+q7zcp7yOavO//Np4Q=;
        b=jUbBgwx3ZHMje693Xe66RrW+Vfr29hsmPUfGj677YLsXmQtaOexnAzG1CxNa4Je2iZ
         aMJrJaycwuz5gzoHOLHOgb3Bs2YzoiTjUXoNUV/XlwvicROJuej9s8Bdz1o4FkuPquM4
         /j1qHAClSpifwSSExbC+5/UAsLSxnDpu4e9RAGGPFxKlQYZ/mmUobgWcZxPTubl6WzLO
         OHFTbSATBXElw5FDMn9+MMKuNklb0RX5/tczg2hmtPRy2TmmCNZrYlmoevidaIgjpAh5
         OLPjlknARCaxDRmPJ5uG+RNYOB0AflmMnUE9bFsR1wRQgP/8bBJgzNBBOq70Yy0BBgW2
         IQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756884000; x=1757488800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=En2W+hPUiVIc0l1BQLH8vAPb/+q7zcp7yOavO//Np4Q=;
        b=T/EeY8e2h/cis8AxcXxxMyRKJ95Tqd9qFIG/KgjyPSQZOCBzVV6wC0ndmk0KmbebNl
         BGFHPtHcN+0s1/DLxXSD+d5lCfgzyRi2Vsn2iMb0LjaMwDds1mBCDKojqo5H0YvowTu2
         FYoDoZWnEF4eLYaKIKEbBKQNOMfKSxJSHo1RGqN1tpz3HIwIkG3yPmfBrnc5wTYwcM+j
         n/dEMdDa/ZmN5k6UKxIG9anU21RE1UnxilAbJ3w8NApKcM5ZHXqMpVSD9OM1M5pEW/et
         I6BfanyRAfjxE/KcTeEVkDnnKKlF5k1eDNF6vL4beU1HoVBUJwWdl8Bd5HsUXNCpHVEB
         LkwA==
X-Forwarded-Encrypted: i=1; AJvYcCXbA/xMxRt5hdPw09sx/Cy377AzRCP+cQqxPjw07mKa64Ju3lztay6SrR6H1daOOf1AHUA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxkqAQ8Ip/ZWJveT7MB3jPosGCHMAaXqURcVpBaly1d0ZAbM9xT
	8ScmSA3gZwo9ECjTNkuGdTOvS4zkQMMvkKUMBF65rYd2bFQM6qBh6pGEFK1W5p/urB9Lfrzp5i0
	OkWMWdFBdluhSMjx/URE3xMpoEPSRl0q3rpUV
X-Gm-Gg: ASbGnctl5nFNxkPc17oyekeO6G8wTB3IV1CZZfoLStoMfBjqyfb5fW2NZW1rOr7hnOU
	YkGliCTUhiTuuwJ9fY57HFaONLnUWhcikJfBVT3Y2kQiD8/di3WBKtE6DDfjBw27GBpHiEENHBS
	N7C/qEi+8eEdwMaMwjy1Lo4S0xgtD4qmuaf30glW+zNYi4CFjXdzzvfyiOYvrlqgxxQtL6ltmjg
	+4doj3I4ucPKvDb7WZav8Bl5Q/6R+qVm5DP
X-Google-Smtp-Source: AGHT+IFgXEs9NteFHdZr1OCmOw5SCukuxyKq+mxKrX1PC589u8zK1b13OsCdHiT3Ob0jVHFeDF/+Ra11+ZAP+EwLTBM=
X-Received: by 2002:a17:90b:5190:b0:324:ece9:6afb with SMTP id
 98e67ed59e1d1-3281541225emr18498018a91.3.1756884000281; Wed, 03 Sep 2025
 00:20:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com>
 <20250821-imx95-rproc-1-v5-2-e93191dfac51@nxp.com> <aLHOhKpAQbVCC76-@p14s>
 <20250830125208.GA22718@nxa18884-linux.ap.freescale.net> <aLcdmY-gqd5cFOYc@p14s>
 <20250903045611.GA8860@nxa18884-linux.ap.freescale.net> <20250903063915.GA18615@nxa18884-linux.ap.freescale.net>
In-Reply-To: <20250903063915.GA18615@nxa18884-linux.ap.freescale.net>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 3 Sep 2025 10:22:14 +0300
X-Gm-Features: Ac12FXxuv1frbjT6JpqFVSJ0lAsIa-N1aZl19LOvbbQz194JtJV08sWoT5Y27zE
Message-ID: <CAEnQRZBCxp4rT=es3fDh2w1Ut=i4u3GCnyoOFjqJEMj3CLWPWA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] remoteproc: imx_rproc: Add support for System
 Manager API
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Peng Fan <peng.fan@nxp.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<snip>

> >Please give detailed suggestions, but not a general comment.
>
>
> @Daniel, @Frank =E2=80=94 since you've reviewed and R-b'd this patchset, =
do you
> have thoughts on the latest feedback from Mathieu? Would you agree that
> further simplification is needed, or is the current structure acceptable?=
=E2=80=9D

Peng, please trim the message when replying so that you keep only
relevant part of the text.

I think you are both right here. I understand your frustration :)
but also Mathieu's point of view is reasonable.

For a person who doesn't know the internals of IMX remoteproc the code
is a little
bit hard to understand. Peng I've given you my R-b because even if the
feels like
it is getting complicated it is still manageable and you are the
maintainer for it.

Allow me a few days to see if we can simplify the logic.

thanks,
Daniel.
