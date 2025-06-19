Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5349D63B9
	for <imx@lists.linux.dev>; Thu, 19 Jun 2025 17:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750353397; cv=none; b=uEuXViGFIibBwRezDNhcnHY7i+Oef0MbGiUikZhtO/jgwvLaU4B88dNx8WKUczDKcb5dEmFJW2u8M46PCICbxCz340+D9DdxW31GuAMHZuG93UjMo2Ogb08I54jKx9y7snkKDj3WFFXxvXbcmbgQU2vGbcPS3TM4CcUZqG+Jzh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750353397; c=relaxed/simple;
	bh=vavngEW490W1TVlna35U5JsoXyvTKiOlogApqdvOnX8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VcVjJ3Bw7MYjKPEuauJA/Z7+2HiqtgQF6MKCRWyuO3ULwoM8WLv2I8gV8tf8UqweWnxOQtFY5pwdQfC60pSId36WIwoyGGsqmZYrB6x6fqXX9C8OUtdCzoEFN2aoi58V1fwuG+HX5S1UezDTuWIB0MqDN54l/8UsRQ+usbmXB0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=cN71WXSj; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="cN71WXSj"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fabe9446a0so10312336d6.2
        for <imx@lists.linux.dev>; Thu, 19 Jun 2025 10:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1750353394; x=1750958194; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vavngEW490W1TVlna35U5JsoXyvTKiOlogApqdvOnX8=;
        b=cN71WXSjfcC4BBWOmfKhV49kbR4CMlBiJSymLsgKfYbX7fANvm7ff3q5Xx5CPgCk93
         BrIC9BxyQ2S6zxO9FYo35CFmBcoH3JAD4z4d4IgJprVf7R+YsG0D1KMo3jTkWOd/qYmm
         mxgFGGPgcN8qrmaTOdZYhEFJgGQm4haqeau2pRtwqOIJuePQE8qSaWFGvPUFseDTuL8p
         qHAPoxoZ7bMRH47NpOaE7uWYOToQZpRuUbOg0YujFy6Jyj1HPlMR4SZnCrcPUw8Pte4Z
         CoHku7TxpRz0P+XvpplhKAalG+UEiU3wZVbUV3Yd2YrtA4Roxhx5TiCe8F2Dxj7DhDQ8
         bP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750353394; x=1750958194;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vavngEW490W1TVlna35U5JsoXyvTKiOlogApqdvOnX8=;
        b=E7p0SVP4pzofO0MlJ23alsTDO+IBH2G0PWVXuJk5uAQiHLq2oL+N6OWbW5HrW5Gi9v
         PWZ8vsxbJqLBuXZM628CckwLv2aK8uzeN9ZYVKJLUDmRtMp9jj+KUL1XnzryjkC0j5H2
         zP6sUqLWoTQMpqx3bboM/0Zi3+y1XoI3o4uLzRCy/xEG8nBWtH8Fk81gXmM+rv6TreE5
         TdhY4GUIlRXouyTU1Dk9TZsL+ijnKphnQ97t5pvUb7Aeya/n+gIbyDgUNSnlBw2FU106
         E/r6dwmwTlef+TZQI8i7IQdAe8dsvfIfp8JNsaACCBU3n1CmxKBi8VIYfpcwZqwz4hDi
         +xsw==
X-Forwarded-Encrypted: i=1; AJvYcCVAE0ZMAmf/CnU29hYye+yUGljEi2IjZ0/Ld9hFz74kgfI6vrcCuB7EuJcXaD2gBsHLxgE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyELCDUAO/iqUpua8rYdRHYAl2M3xh3SBWbM2eYVL6DZAkHxtym
	LFZxiiD8NywzUVKfUz21DMwSBJwh37QJOmwgn+TOa5qHfx1+oeTSvoRrJwYsDogMTh4=
X-Gm-Gg: ASbGncvl3quWDinlsuhUKciVK37wcl5gdFyK2OLA7xk72D6RsX7mIciwXQpjsECQdR3
	ri69VXsap0k7KrVlqIgPUxNGUjsGWGAy9mPYXWrooVOm8NXjyhoeUqJ+1VecUSt5ec2Sq5HIRI/
	e0CN7PNpZwx1RPkewPXSEsQHZ6R8gSIT0sxsNROLWcjrSVViuGqfTx2Uw8dXYLRHgL0z4r6Cq5r
	WhvDRHuHttT+TcWYsCP3PI8sUv1KSmVYFqHw6SHPR6FIPo/TncIL4WWJXacv/4b1gAK8TLSVYG2
	YTGi6YuFvNLdVwb2q591IrFYBDHoTU9vU+lICy/kRJSk9JR/Ily4hcysDUfaTUwgimc=
X-Google-Smtp-Source: AGHT+IFZGR1oLZzp6cLHcCiYls3uKiELGOeDzcSxdXOkGm/XLOLstBIyI7bjhXg4re8Xuf3yDJehIw==
X-Received: by 2002:a05:6214:540c:b0:6fb:4e46:7f3a with SMTP id 6a1803df08f44-6fd0a4d68f5mr760206d6.16.1750353394282;
        Thu, 19 Jun 2025 10:16:34 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::5ac? ([2606:6d00:17:b699::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f8e4b0f7sm19537985a.67.2025.06.19.10.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 10:16:33 -0700 (PDT)
Message-ID: <d46d73f84e78daf152962ffb5cce7dd3ae0920d1.camel@ndufresne.ca>
Subject: Re: [PATCH RESEND 1/2] media: dt-bindings: nxp,imx8-jpeg: Add
 compatible strings for IMX95 JPEG
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Frank Li <Frank.Li@nxp.com>, mirela.rabulea@nxp.com, mchehab@kernel.org,
 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, 	s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, 	krzysztof.kozlowski@linaro.org, imx@lists.linux.dev,
 linux-media@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 ming.qian@nxp.com
Date: Thu, 19 Jun 2025 13:16:32 -0400
In-Reply-To: <aFORokzx/sImgDtA@dragon>
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
	 <20250521173444.310641-1-Frank.Li@nxp.com>
	 <eef5ccd99d82dd33e3a4ecdb5d4a5b75ccb0b972.camel@ndufresne.ca>
	 <aFORokzx/sImgDtA@dragon>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Le jeudi 19 juin 2025 =C3=A0 12:27 +0800, Shawn Guo a =C3=A9crit=C2=A0:
> On Fri, May 23, 2025 at 07:22:04PM -0400, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le mercredi 21 mai 2025 =C3=A0 13:34 -0400, Frank Li a =C3=A9crit=C2=A0=
:
> > > Add compatible strings "nxp,imx95-jpgdec" and "nxp,imx95-jpgenc", whi=
ch
> > > are backward compatible with "nxp,imx8qxp-jpgdec" and
> > > "nxp,imx8qxp-jpegenc". i.MX95 just need one power domain which combin=
e
> > > wrap and all slots together. Reduce minItems of power-domains to 1 fo=
r
> > > i.MX95 and keep the same restriction for others.
> > >=20
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> >=20
> > Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> >=20
> > Krzysztof, will you take this one once the DTS part is ready ?
>=20
> dt-bindings is the prerequisite of DTS.=C2=A0 DTS patch looks good to me
> and I'm waiting for dt-bindings part to be applied first.

I was waiting for sign of life on the DTS part, we usually get some ack,
which is good sign we can take the bindings.

Nicolas
