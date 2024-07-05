Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BCB1442FD
	for <imx@lists.linux.dev>; Fri,  5 Jul 2024 12:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720182432; cv=none; b=LMDcyMDlnRzuLXkEmhM5aPgs+9CPSfv2Bw8bqMdgyH2PZzBEf3Bl1lUOlBhMQ3AijmQ/JsZwQT+oFaOiQgrY2MbI98JYHlX1+IEKicKCCOajhBwQcri4y4EPXC86sazRjypLzxr+Fs6HGyBIJk2WnxuLoGKpOkq6jLJAgUn1n90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720182432; c=relaxed/simple;
	bh=sIWevVUKkb7FOCasj7mQTl9nMdE+rJH3P8UkJXqyiYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oMh95qMPjsKonBSn068C7JPKA45LGHc6pgWxyMsUnyxFWC5MbeuYK//Ay61+FuZ+MWvXNX/ajUTaC4hFnRe348FAda1u7MI7t+z34oQ4ONcX/kwI9hUgBKH1KjbW90FqZprUHDCOW+ETDM5te+OWCeWty33mr0LYPRQ3564JSwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyNknGD3; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyNknGD3"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ec89b67bfcso2275201fa.3
        for <imx@lists.linux.dev>; Fri, 05 Jul 2024 05:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720182429; x=1720787229; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIWevVUKkb7FOCasj7mQTl9nMdE+rJH3P8UkJXqyiYg=;
        b=WyNknGD3w+oaQvkG/NMI6KWKCJMschIsKYCuO02UQtoB3uDBx8iGqON15CHBFzdwNv
         viieWTNm5dVo0foyVOP5HCJ/Gtw8nyAJUFSOHC3VOu2lliOHRqLsRStuHRbZBcRVnADm
         wvWJAt/WuNRK0l+ReelrXak+zJpOgjDVr8tAu1qeP5HkUpdvW9NlNbpLGrCYPRQrIN0w
         Yr0hly26hy99altTufN5x5Tvvt9PDErTLVxXotQulrULr8x+AJuNKQsRBC+RIDzAWQN0
         K8itMjXV701Kb9VJHQtwLzqdd6VMwOoWShJWRY5IHIi5dLwFXzE3p4Ej49EQsR8GGKGu
         MWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720182429; x=1720787229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sIWevVUKkb7FOCasj7mQTl9nMdE+rJH3P8UkJXqyiYg=;
        b=CJE00/ssV8iCfUgA1t7rQd0j2eokViyrnXqKlUOgnQ9ice5OXP2fZ/FcG1ZJy5AUU/
         +i0+N70bjhbtArV4HSt1RzO9wR7Y4iNMoUnqovu2S9ciT+Lewybh1lnta5D60OSYdZID
         esBfTigdwc41duyuBmFPhZa3uX+jgN9wA65BG0n1BD1TAuKE8BMpuLmdEV1IPe4OlSCG
         cIxVR2qw7XrqPG43exafH2rSH4oWOka5I7FdhfK9a8lScBL69YUrDp6PyfGDbjHCg5Of
         ptacFSuEiG9HzMRCSzNxuiY9iiF2rW2iUws73HWT3iveIkoA+ERYRt6bIeYuLrH88W32
         vS9g==
X-Forwarded-Encrypted: i=1; AJvYcCXUhpiProyb3UBk/Nn6NZrVmApfovIDz9Yj/MR5JAIOXibNzzzzlCdhLAmxAGAsXGfMBcVwSBBasH4CAEGsDLxYNrZB
X-Gm-Message-State: AOJu0Yy76ZUIq/ZbBU8hH+3vvQG4wFXUloO5imW7mK9O2ekp8+pyX1u7
	mcoroNKTY3cudftP7TMgZI6EvrdFOQdc912ZPnwJ4lkxsalogc7NulXcsnG4XXJwVr7PoTcUdsk
	jB58ULhxz8WvlQmVHO3F5aZaAkLo=
X-Google-Smtp-Source: AGHT+IE8OV1AeVxu2SX0O/PkjN0a38BZTc66Pul7Ij78t5Gphi3uH38+dmdzatGgs+bEAS/I8hEOBqE62yBpxruHbxw=
X-Received: by 2002:a2e:8183:0:b0:2ee:4a99:6a3a with SMTP id
 38308e7fff4ca-2ee8ed9589fmr29383411fa.2.1720182428647; Fri, 05 Jul 2024
 05:27:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240705-bspimx8m-3180-v2-1-dc1a7e1689be@phytec.de>
In-Reply-To: <20240705-bspimx8m-3180-v2-1-dc1a7e1689be@phytec.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 5 Jul 2024 09:26:56 -0300
Message-ID: <CAOMZO5BEHoAycqQehddA_d03nrKkNnbcTAkq=VXww0d6HRHFdQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: freescale: imx8mp-phycore: Add no-eth overlay
To: Benjamin Hahn <B.Hahn@phytec.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	upstream@lists.phytec.de, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Benjamin,

On Fri, Jul 5, 2024 at 9:14=E2=80=AFAM Benjamin Hahn <B.Hahn@phytec.de> wro=
te:
>
> Add a devicetree overlay to disable ethernet for boards where it is not
> populated.
>
> Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
> ---
> Changes in v2:
> - Remove the compatible from the overlay

Reviewed-by: Fabio Estevam <festevam@gmail.com>
