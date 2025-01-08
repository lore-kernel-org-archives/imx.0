Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3251AA7A3
	for <imx@lists.linux.dev>; Wed,  8 Jan 2025 19:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736364863; cv=none; b=sBQ+LMUl3b1GovpY12na/t0vn2uMHXMsTSk7jAgoXwCvLsQtVFGyEu0ZRiBp5E0XaYQp17xbFacXXS7g4KTUUr4TLTQyJYcVnLYIp8RvWx8eTY/SvX7MbWMm/x75ozHzMPNs6tEGGYSh4MlaOqlW0bfasip/3eyBPZU1WHWiyG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736364863; c=relaxed/simple;
	bh=AwXV8eOYa0jUUOJDLNlx4dV6qMMcao5DisevpgqObMQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y86W2H7zcPQj4kxwn5twJ1ugj6v4cgBFxioq+snB0sOCjc2AffRk5lCt4vgQ2Wklgo4g2a+00r/AvHrPby3vOY+vXYQjqFvoN9N4iv6RdWhZtXRSbIDmY2nN42fgmvqNPrJCmRP/I/XzzdmbXnLPGNhvmOeUOdTTEQtQOdjKQtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=GRMEs6+O; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="GRMEs6+O"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4678cd314b6so612971cf.3
        for <imx@lists.linux.dev>; Wed, 08 Jan 2025 11:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1736364861; x=1736969661; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pZ8OaEnCblGa//gqGF016T+aNas0t6We2C1yQ9rLcFU=;
        b=GRMEs6+OtFgYBtxJMYDbK5PYurpvjpWzoqHOMKih8Ykg4MpVrDB+b+PWtnj4+Rz60x
         7c19D4f2n6vv7zO8mYL8Y1n2F55cW9Ne/Zxw8HyUey/+zgdyxIjb5BXZQFwWTiSrvi1X
         u0ZwL4GfM/kInyWMW95TOmgEn7cy1FvMSRuFafw1mA0gzo6Qgae1klkAmz6DvZOydHNL
         nc/Rzunf75QXk/bmMvre3RZK4tdyqpZXliJVDJIL2KpCmTD2oBb9B/MZjNO+e68IqNIa
         btWmeVoTIcVA1xWqiKR78mIAuET/yBSFJJulS+S2xmnkefAaLHsple9tf1+j65104U03
         MBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736364861; x=1736969661;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pZ8OaEnCblGa//gqGF016T+aNas0t6We2C1yQ9rLcFU=;
        b=Q5Q2Yzqk5qghz6sGii7igwOaPWOnmHeLri2hChV8Ty3J+bNLD3hC3Aa3ilACGnjmIv
         QhjCE+WnuIzcy9rr8no5SC/EfDulAfrGnRijVPJlvN2ww9pWqWbgTBDRSvGWIbrkUppN
         Ls51pb97Xn2ZuqAAnlAN+ZncWH49B8rfe71ntfwxSyvb/RFk5ZeRxGF1VN8FDnDcKp7q
         LuCmsPmrrQJCNVllWxa5jC4+GcNiUJm7uMhVczg5ieHrtu1xphO0W6D4tiHUEv1Kq75I
         VgwrDg2nM4CtKHAtFJrLeAP4BU05pukr/wp7t76rtPC7k9G5Efr4vCeVm4XwM6Pg/uim
         tSeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrcEzVmQgqgTdso51GmN+FOuY3Hqax93PkkrE2/NX6cWMwsdsNkKBEA7lZIzq0m9xkqsE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWW+mzsfo313hvzpgRyrS9MhXmMFwsBZTMr6004bIn1CtkVVwe
	AKeYfCpp6t2n0aP66sLTeW5wN9GO+/gcwefFKhex4W1OvyV4o48Z0QD5I/VweA4=
X-Gm-Gg: ASbGncsj5SB+teWLLB9v0cUajhaWost9bYgxoa/dJRTDccfVidvYY30Dlwhek+/GNHv
	L6DEMpsNs33sIqwhTjmAoFPTfSDxofQQmmTGYSYsiLiZ5sf///03cIXTb8MWpEEDTHqLPAuBN1I
	WdqpmGfF/CzcGLSS3krJcjsppbrH8QLmePU7mTo0MeMyeoEPSOoor+KpCdalVXZnmuP6PeLJI36
	KRguWr60RjRZ/q6v6U0QE+rkHe2IKaASERYqkQuxYx4kU96Q6R8AaXSmw==
X-Google-Smtp-Source: AGHT+IHHoBOVEADoDwJ5SEc2bvPkTd9ig7fH6khIBw3ziijVw29fWtXY3bUiaQ9CQqXYbSXbLj0hfg==
X-Received: by 2002:a05:622a:1792:b0:463:64b2:2e0d with SMTP id d75a77b69052e-46c7107a922mr65440061cf.40.1736364860717;
        Wed, 08 Jan 2025 11:34:20 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb16c7bsm199636001cf.63.2025.01.08.11.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 11:34:20 -0800 (PST)
Message-ID: <dcae7fbb810ebfa6e539c3b45c20e1d659600d80.camel@ndufresne.ca>
Subject: Re: [PATCH] media: docs: dev-decoder: Trigger dynamic source change
 for colorspace
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ming Qian <ming.qian@oss.nxp.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, 	eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Wed, 08 Jan 2025 14:34:19 -0500
In-Reply-To: <20250107053622.1287461-1-ming.qian@oss.nxp.com>
References: <20250107053622.1287461-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi,

Le mardi 07 janvier 2025 =C3=A0 14:36 +0900, Ming Qian a =C3=A9crit=C2=A0:
> If colorspace changes, the client needs to renegotiate the pipeline,
> otherwise the decoded frame may not be displayed correctly.
>=20
> If it can trigger an source change event, then client can switch to the
> correct stream setting. And each frame can be displayed properly.
>=20
> So add colorspace as a trigger parameter for dynamic resolution change.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
>  Documentation/userspace-api/media/v4l/dev-decoder.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Docu=
mentation/userspace-api/media/v4l/dev-decoder.rst
> index ef8e8cf31f90..49566569ad26 100644
> --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> @@ -932,7 +932,9 @@ reflected by corresponding queries):
> =20
>  * the minimum number of buffers needed for decoding,
> =20
> -* bit-depth of the bitstream has been changed.
> +* bit-depth of the bitstream has been changed,
> +
> +* colorspace of the bitstream has been changed.

Did you really mean colorspace in the way this term is used in V4L2 ? What =
we
want this event to be used for is when the capture storage size or amount
changes, perhaps you mean when the capture pixelformat changes ? This will
indeed happen if you change the bit-depth, subsampling (not mentioned here
either) or change the way colors are repsented (RGB, YCbCr, etc.).

> =20
>  Whenever that happens, the decoder must proceed as follows:
> =20

