Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244847F9
	for <imx@lists.linux.dev>; Wed,  4 Sep 2024 18:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725474684; cv=none; b=i3/WeUunpItWjKL9mSizH5KjL4plDj6kCedZxIg/3YXaIqhsmIBbjcfzFMyIXYEQldhkMAY4ZVwqhwO6xeawyWvN2d45nwFvoBQxd9Bk0qFxWvqS2TzFz8BHRjIOtw9ZCA8Rfnnfx9NdiEJGkJZ/u8hjB2TJxBPlzrw/EXAR258=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725474684; c=relaxed/simple;
	bh=cqZTeCKtiWRNmN3gcAtdrz7XjCzXiplabvraNaLf8FE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oPfya0E5xc4iZ7vlfAAtmS4nPwmCuVDRssL6i/6HZbzwbKWPoZEypk4j/E204K09Z35WIGQAivegnIuw5MyJcV4XfA0yOJiWEekUy9yqzGzT9Ute0/fNyiVFynQd3mDwPfAgVaUkiHz9D5v/5ebChHQ2OOdENiFJ3xK25u2ySJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qt6shaxf; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qt6shaxf"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-533496017f8so9131586e87.0
        for <imx@lists.linux.dev>; Wed, 04 Sep 2024 11:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725474681; x=1726079481; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqZTeCKtiWRNmN3gcAtdrz7XjCzXiplabvraNaLf8FE=;
        b=Qt6shaxfz79IEsECVG9F3rdcIwmroSMbphBReZK34XzMlWMcFO6bAg9Cxq0oc6/ieg
         WY8eLkJKyjTyZ4K45nutUb3Gn8liQ6nqGqF+s4uNogf5ZMQOZF3ct7QcnW0mOlJ88b7D
         zRfvw/U3YwkZhHtjcRQMvoSG67OngzFpw5nosQsXp7aqUrROds8oGilhsu26a4y2mfh7
         Bx4dNynnZ+v2YmPzht70qEkpp4gMmspZRRb1s62VMOMTSQoqy1h17oooDcv6BsTjo8wY
         0aOiXgKoh9GUnxvs8FpNbZCSWH2snFRZu66PN4h2TJ/ssvTsRb3Mg7Cp/1boEIHu9hvi
         iSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725474681; x=1726079481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqZTeCKtiWRNmN3gcAtdrz7XjCzXiplabvraNaLf8FE=;
        b=cDvW0uJ+8zZceNraAUm3SDJ44mqfCmykirUTHL0qgZ2hjAeIqwuNXz4UtAD3XuXSV3
         XvOXx8ya2BV1Z5YvRx/PBNc1bSK6Jn4omfqE/85//TjEa0p4jo7WMDaZPkOt2HVc2370
         bhEHoTRhevBebg7/CJSROYghu9QguKAiVBRGSQj0dpnT/+WBMI4zjRK2gypovLq7pcoP
         ayvP4JH3XJhXs+2gY8RBaCX0ui92s/WuB6pDjngbuJYDEacryC6APgRAnqlZCPlpjbmx
         S+ZT0cK1bqpN902Y06G9AS41c0CkhW1UcyhdEjIzUTiWxeQTf5RtkXztL5UCRyMDYx9+
         ctiA==
X-Forwarded-Encrypted: i=1; AJvYcCV4T36SOpoe+W2PoBUeL2Zt9bHLxIJgEYGlFfJton20Og1NbdWder9h/k2Lyq15+HqyVSY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyp/qf8GhyooJAiCVO5dXSLFVTeB2cvXOUZnFGOe2fS4qojkJCc
	OT0r0ZnzZVTCDcMOdG+nA8gt9unuqVLfUQKol+9oMBik3YgqYyjroosMcU5aZSScy8ZQnvVRW57
	3HmE+IqaymJhahyGBGhO3P2b1rvM=
X-Google-Smtp-Source: AGHT+IFPTDmBPzfMHi+JBca0iBl6QnzPcfCv2Mi+TGhi7mW9W3f/6R0U2aXmin1rHR0zhBgKT/q01r6RE4rYphIlEjY=
X-Received: by 2002:a05:6512:159a:b0:52c:e047:5c38 with SMTP id
 2adb3069b0e04-53546b0401cmr12698659e87.15.1725474680916; Wed, 04 Sep 2024
 11:31:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240904-imx-se-if-v7-0-5afd2ab74264@nxp.com> <Zth7LdsV/KbjzB2b@lizhi-Precision-Tower-5810>
 <AM9PR04MB86049FFFCBB357E3BC1E4C90959C2@AM9PR04MB8604.eurprd04.prod.outlook.com>
In-Reply-To: <AM9PR04MB86049FFFCBB357E3BC1E4C90959C2@AM9PR04MB8604.eurprd04.prod.outlook.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 4 Sep 2024 15:31:09 -0300
Message-ID: <CAOMZO5DdujNkL91+8tzO2VzS20ipRGDCyzo8ppa0A33V0ZvabA@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] Changes in v7:
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 1:09=E2=80=AFPM Pankaj Gupta <pankaj.gupta@nxp.com> =
wrote:

> Thanks for pointing it out. Will ensure not to repeat it.

Please trim your replies.

Your email had 341 lines and your response was on a single line.

Please remove unneeded noise in your replies.
