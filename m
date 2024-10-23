Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE2C1E4A4
	for <imx@lists.linux.dev>; Wed, 23 Oct 2024 23:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729727113; cv=none; b=a7kedyWLyDH/hudC1aEoIVLu4SVor7dQ/+OhhqB8LRP7nodsS2/aT1nEDTSU/mv7zbTQMKRM+LeGNsaVldZiU9tug21+IKIIFm+wcXApJ6j6/Ol4+ZZFSyQ55iL/cA9VIVbuSJjm8vS14s7pScCiUNxNrXOB0pT/nbLDN1KcyAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729727113; c=relaxed/simple;
	bh=fzf50MUZplBxsUpuKQW50cchRIYkDdV0j2dgIHJIcLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hRmoWCaTJ2HZ22GuMPW9P9++W1hWuEl6kUk6+r6QgEQ8Q1n16d5m3/OTMINAEDWg+FWqEC8/AWllaabG2ElW5sMqqfdphHoQn8rApzifZGhUJJtvqQ09AyVKYDeD9r9PKDLVw9rgf5QyGydwTEeJMVutFSsCXnG1sSSGbJtLq5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXhLhvk8; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXhLhvk8"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f1292a9bso308342e87.2
        for <imx@lists.linux.dev>; Wed, 23 Oct 2024 16:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729727109; x=1730331909; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FH7t34m9dnmNlx93O1yGS5tEDefFHyWRqMdXdmIkhjw=;
        b=IXhLhvk8KIobGqCY7mo650grMKzvzKa/8AqIENrj/aPmKaqQj8p7F3tVh31EW7swOR
         K5D4SUG3WuaGCr8eQaujW8dJnI1/nUvHvcv6iwI43P8hq+M6vvbwVN+iiOHUO8Sv6m1E
         5XhXrjXLaiNQvDC84a+1m/VMb9+h1lnAvoeAsYrEUnsmtq8Gsqu256sjgqm0HtMQynrm
         22YLrS5XyoTdS6HTZw+n8bHHeoMYMlD2MDK8P0U+JWkAQb++GdaqW67DLTT1aRmsUWmo
         CV2RLgXW9628TVj5vZtwfNBybDr4MmVMyWm8j/Y3ffiWW6ZpwArW0PO4gQxcBNipDg+W
         iXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729727109; x=1730331909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FH7t34m9dnmNlx93O1yGS5tEDefFHyWRqMdXdmIkhjw=;
        b=Vay/70cjA786YC8UUrc17kO7C8yfanvg5A3l4W4NwkyduCpIkYPc0QjdsRMMjrcB/4
         GaYq8jdlSUCVSjO9c4frHK4BtXujEEoCDYL85uE5gFlzoLdm/n8zG398yBs4nkPa29mn
         UHMzA2nc7+sM7j3lWCRN5c7XyhG9WySpV/TnHUSrN6/GkFKjgCMfMI95csgOHklSYxbQ
         BAzmByzkAsfbEXzWKc0BgXuDYEx9o6e/O+El6Z/JmeSibyHCRH5eYJBMyMO0lSrkLEVS
         6RlQWzXkfnoJIupOAgotpx3MZyE34U2zliCv81LqRM2EhC60/E2EtdvtF2BD8GGhKld5
         69dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfar79kFpQIQiUZZoxklJG2X2mIE0xku6lX0sHcl8W0wbGAlMLfdsxx35x6t6H5R6bM7I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyd9UxGl9FLouIsUk8jTRokxWEGZNpwiJWDaE1TxrlqH5aFEq46
	J4SZWQ4DV6nbJ9na/QLAsqnq0dylOFkatMGg3z6qxZg7lqKJZUq47fcj/XOzz9+++SsO7e03Vjk
	92LLjFobZtJowjbl/YHVEweylbaQ=
X-Google-Smtp-Source: AGHT+IEASdtebovTt/XdTVLz8Q7Z69ffMVx0+m03VPWdJ2zICo/83A8gUVc3cJP1yjUZ/fTdn/o+yvavDg7XA0S174U=
X-Received: by 2002:a05:6512:31c3:b0:539:8980:2009 with SMTP id
 2adb3069b0e04-53b23e37dfemr7297e87.36.1729727108832; Wed, 23 Oct 2024
 16:45:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241023221112.1393280-1-Frank.Li@nxp.com>
In-Reply-To: <20241023221112.1393280-1-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 23 Oct 2024 20:44:56 -0300
Message-ID: <CAOMZO5AL9nFHbcLe9HP8Rf99UBX-Pk76xc1zU8TaLgA1tgNH-g@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mn-bsh-smm-s2pro: remove undocument
 property 'clocks' for audio-codec@18
To: Frank Li <Frank.Li@nxp.com>, Michael Trimarchi <michael@amarulasolutions.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

On Wed, Oct 23, 2024 at 7:11=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Remove undocument property 'clocks' for audio-codec@18, which compatible
> string is 'ti,tlv320dac3101'.
>
> Fix below CHECK_DTBS warning:
>  audio-codec@18: Unevaluated properties are not allowed ('clocks' was une=
xpected)
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

I have already submitted this change:

https://lore.kernel.org/linux-arm-kernel/CAOf5uwmg83-TVQvbNOCnzBh9JdQAC=3D5=
hpgbCeT-6qJ=3D+YBrssg@mail.gmail.com/

I am waiting for Michael to test it.
