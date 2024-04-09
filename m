Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D782F7E774
	for <imx@lists.linux.dev>; Tue,  9 Apr 2024 10:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712656935; cv=none; b=hW14vuVsX9DeeN4KFay9iJnwALMiQmpBFFLXvxOVNGY7Q7oqYm6fVF97+JAnj1b2k9Psk9XP31tfyexSTu/xqEx8up8UK4pcHaxWBa+mU7xm77mtLSjC1vEMnVrH6OgC3pUrvmgjuwdFNQlvbp+DJEleavb0X7A7v8t7N16aPDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712656935; c=relaxed/simple;
	bh=fMMPR+Yh9gYVL2djxLycCTl77gxWuXN3esxhzd6/Pb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=seuQzkNIbspZJIoGav7DxarJNIE21BLq1oQOXu4e6X6iL6RmEpsavMP2VZqv3ieqBmoqtlJJJ5bUILRiHVglxg0oEyVeATm8gakk71MWrrx3jrEo/QLh8WaTN1SvpjKDILYVOHDwxJ1oZtkpGRuygOq/6ohI3uvPUaLQpngyONo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N9FrzA+6; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9FrzA+6"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2a2f2cd61cdso1398815a91.1
        for <imx@lists.linux.dev>; Tue, 09 Apr 2024 03:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712656933; x=1713261733; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMMPR+Yh9gYVL2djxLycCTl77gxWuXN3esxhzd6/Pb0=;
        b=N9FrzA+6D+MbxNrKjKzRB/0mii0VpTh7ZrT5IAhdG+6Cf2HB/v6ORI63C8rVjmBOMu
         FSLrVh5TTbOwWcLbRqum86H5ZN5T/svxVORAAwxaLBFEU6q5lYsdhNHCKNbiJpDqjLvx
         eqYIscCUhp4Fy5Xc8FahPQ8322rIgwNUp+9yAlwS4hwOAnX0v18G8+Lv8d7+1u5WNlNG
         ebgJ5gYOrZU2aHqH5GFisTBRnOdzHeAyW82WeeSKD8JLXotMPxrzElzcEMe/cAizUPUP
         qiIsXZoS3K94vq0tsskE34NKXw+R4w1wTzsAcA1rVKKt8QfgUlO7vnXjK9Mly0vlvGvY
         5J3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712656933; x=1713261733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMMPR+Yh9gYVL2djxLycCTl77gxWuXN3esxhzd6/Pb0=;
        b=JO2MGT8YD5boqF8tDcbTXl3zr1XkwajgjWrABmNy9lMOTTLmxZmw6lor1pSzRWOV4X
         I3kj9+Ds9kWNCT50NkJGC3HrxljYgFB/LT71eQN83oBS5ugRAKPuZ/XcI1cvZlQlP7dT
         Ub0+LmNcZ53DfuTfHuQo+3TG1laMMbdSaiCDQPjZdfSR9Kp+hebEMEWfEXZGfWJEUB1X
         7Wl9vNE0tYIlehLamx2hiWdCyTniCtl9+12U20uT76yxSiNcHA87+IS2W89kH8BaXlLP
         U3oE+QJR3DfuWNs4zw7Hb4KfCR4UvFnzfVlevow6JDBp/Ehhl7HL1JVvoZKRPLp1vxJT
         K32Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFXpmIDEl/W4ZBXkM0PGUbvg5aGCKJMKDxdnE8i3kAjckBvSt1XFYJ+vwKk0TCPiy9+JQ6HJDo3Edvq0ysu6Hyt9N4
X-Gm-Message-State: AOJu0YyEoLVf9nxFHYQhpyunriNctPV1/RQMeRedmR+ZcPJDHx+Sbzy7
	xJ//7r08vkfFmjhLs9ctJRlXRIKu33MZCFulj9gqcVI6GJ4vxN7wzmFWjjVEC0wNvbiylxlehTg
	2JznnnGdfYcO+Xm3O+MfG6n8KL4Y=
X-Google-Smtp-Source: AGHT+IELrW9fVmzx05lKtSDUmKkTXNduR8F/EVQ4MLLoyqDY44OGDV7EXL3DQXLowx47WFC00/A9tFArob5eyFuseLA=
X-Received: by 2002:a17:90b:211:b0:2a5:2b1c:90f4 with SMTP id
 fy17-20020a17090b021100b002a52b1c90f4mr4238430pjb.3.1712656933108; Tue, 09
 Apr 2024 03:02:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1712652644-28887-1-git-send-email-shengjiu.wang@nxp.com> <1712652644-28887-3-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1712652644-28887-3-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 9 Apr 2024 07:02:00 -0300
Message-ID: <CAOMZO5Cku1kifsnWJOr0Zd-5+49j-KB67iHZDcvUsKwrhVPtLA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: imx6: exchange fallback and specific
 compatible string
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	shengjiu.wang@gmail.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 6:08=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.com=
> wrote:
>
> exchange fallback and specific compatible string for spdif sound card.

Ok, but please explain the reason.
