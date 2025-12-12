Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411CC315D27
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765533281; cv=none; b=oYcI54/nYMBa2eHAve3ulwQV4HdnNSDzctQP2+4lTA5X3DdevMDyUD9IR8WBWKp0KFEV0x8drlvuMSiCbrPhzlyiPIdQsWzDzIzPoNjO62i1xM8xu98AgohKqRiObIeq6j+NWVKad3ehqPcJ3JxIUkKF2i60g/kEnhfwlI3QI9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765533281; c=relaxed/simple;
	bh=HqEG+nZ1xiQN6AJIt2dnnJZEHC10sC0sNx6sFrPvEsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jx2fZjTJz/5D1veYqL3eFaTF3EuaLFpGX5HMzGw4JAepX01ihZsrZ7/KXWN/0gPHzgrPAqmllpvT/tjG+B6nW0I1N4ncwKX0rkcJrWsYEtEFHw/blDlanLMI/NpNCPuI/pypDBQlCR7f8DA3snDyvELSPAozCQMpJOJ72MrBT70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QItgRldt; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QItgRldt"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-bc09b3d3afeso624260a12.0
        for <imx@lists.linux.dev>; Fri, 12 Dec 2025 01:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765533279; x=1766138079; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqEG+nZ1xiQN6AJIt2dnnJZEHC10sC0sNx6sFrPvEsY=;
        b=QItgRldtnBlxrXWwqRf75jHquo3htOh/EO/EKAiSEOhRlxv4hZA5gOS82zq4Eq3tCH
         6UNpWV4sARgqVeGw/kyExwvFUsXZfGJIVYdqY72rsBpEDB3Kh9f7NDsmrZkkt6OuoNbF
         QmgeG7PZOYvL1UQ8Zzz8hh5Ne4NsZ5guHVeMoD/Y2CFYrqTBtKQqsixS4BkAlWwlfHFW
         QityQwaf8ZTHF5arSlcFxQXwDW2wZesqTmYomSdsIHiJGYbGGwvWvZymrYdRtcldXy7g
         XJjziglNMIBSArMb2cvusaJrLD7SqmbLUP9h2V5T3XUnp9zvmFwc9jp2Ruc73fkW6vZo
         Pbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765533279; x=1766138079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HqEG+nZ1xiQN6AJIt2dnnJZEHC10sC0sNx6sFrPvEsY=;
        b=UQMz+XDwdLj1riggUlerkGUXjZOHbK7NNozXtv3UcdFlQNLni9zVjsz4QZSMVqTobh
         voZd3V2SUIuVn0VHTmNSiIj5rk35WX4eJa5aPWdZJ6k23hVUMpuGkI9ce/U7Sr0JCeUj
         +oV5vjwqR4dXT+Okcg97ohryUmLlryINLQ/IJbK5kUdL2auVa/6uMpURyGTt027Lq9Pp
         WGC0xxYYr08/0dtQkJ9aYPX8Otyg/3zHq/LMUy//gy9YRoKTpHmaGYB/qMkoBgf7dzsX
         Pg+yQTxHeljr0cSXYyDRjvTScq9qVBhE2lv5aMjzFAFEnwCkY0Hy3hunWTTKxDsNknrM
         ekQw==
X-Forwarded-Encrypted: i=1; AJvYcCV01zbSTfQTLeQMveM22ToAht3kqrpDjDXIrDipUtDJ7thPHzifwuVB956gGuBbsfGwZf0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5H6mC9UAFhhrs8Uvl2ukEHwrQeXfh8aC+jdFpYWFJ9L7mWiHn
	GmKPxPhs4F+aOsmxB/izJFp7D53ihPQg/cUr9G6Qcs2+QAdv/7jj7/JAsSV2i8Y7errbH4vxZy+
	V9WBZMaXVy+6JBpYe2WY19kI97IUxPuk=
X-Gm-Gg: AY/fxX6inlbgo7rOvLk8wySBGyBBS2LIL0j6IwAyLskGKCaqtrnt+NnScQ2RcG5OyxV
	+c8rj5ClCk+e4NsIuU3+lV455kbPoPUaNJlN5VHCz4z+iTZPZMgfkVEgx4rKQ3/3KwIuxGynK8z
	gFXfbJEKeNCH0YPtaBEFgiPiPJdB+Wh3ee1kale5Pqv6VtfvE9TKhUVPKbQ4OXVb5mJ4DSK/Ikt
	XyOtSKCKocKyDQ1YuONxLVF7g322BbpYreBF2242oPz27jb/fyLBLowAzNDCpFlF+rBOm9zF1DU
	olWunTUNR1ECP9u3ucAfSh8YmO1Z+OmetTSJ/tVk6sCZcrFTA+9+eSUaduC9+g510GAJXqNXK+c
	/XSyqddE3ITs9JYPp9eYk
X-Google-Smtp-Source: AGHT+IEa+DSQ1zpDC60+Pq9ToEAnCi93aMl+ozGf04DIAogSjg2j0+bhkGR63QOLDEz4eUMryYb2KSl+0LAa0pnns/8=
X-Received: by 2002:a05:7301:2e98:b0:2ac:2e93:29aa with SMTP id
 5a478bee46e88-2ac30106a4dmr1262862eec.28.1765533279469; Fri, 12 Dec 2025
 01:54:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251212-imx91_frdm-v2-0-4dd6d289e81d@nxp.com> <20251212-imx91_frdm-v2-1-4dd6d289e81d@nxp.com>
In-Reply-To: <20251212-imx91_frdm-v2-1-4dd6d289e81d@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 12 Dec 2025 11:57:12 +0200
X-Gm-Features: AQt7F2qmUYq7fmLxWwsl-gTOGPlSokMij1R92_1CGnoPcAOo-CVttUkZ8C_47Hk
Message-ID: <CAEnQRZB7BtSu2ec4wh0353MYkwgzbpQxD7qa0r6NC_kf+hRfKg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: imx Add FRDM-IMX91 board
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Justin Jiang <justin.jiang@nxp.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, qijian.guo@oss.nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2025 at 4:32=E2=80=AFAM Joseph Guo <qijian.guo@nxp.com> wro=
te:
>
> Add the board FRDM-IMX91 in the binding document.
>
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
