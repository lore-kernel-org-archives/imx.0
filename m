Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14E71DE3A4
	for <imx@lists.linux.dev>; Wed, 11 Dec 2024 16:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733934594; cv=none; b=pBti7ESxhqt3vAZyqNxdM9cpQx2sqsL/oM2ndsvCkhlh5cjalUZ5/6XscqCc2hM1DPcGHWsk+Eiqk5gpJdRKV4ffX6fb4/cxKVuyzgZmknaJkOUG1oKdCSJgQgnVNNEGq3Bpn4xCTBwppK3zLugdpAn2Pd5xs3RAnxtO+xAjdaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733934594; c=relaxed/simple;
	bh=XTd+qBJkcHHitLmewhPLFKmUwIQw9mojqeAum8hGMNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ewhepo+tHSS2OLY1udknkg/LQf8XOX3C56shMYKFXJYEtnegKb9i/xSoh/z5+Inns2VtFLyoSx78vdlvlHgmpnGYMN0Td24x7EOnrdNTjVnuho65ojXIcJ+ddm5jc5XsJ2ayjN3dUtUyamS/HXHpcmYWXwQrnc7ESX9jX/CGeUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RArLOvRf; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RArLOvRf"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3003d7ca01cso45069011fa.0
        for <imx@lists.linux.dev>; Wed, 11 Dec 2024 08:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733934591; x=1734539391; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=osyXKRqUv4PvfNbOFslNjYYNVIaS0mD+W2/0VCKnb7I=;
        b=RArLOvRfSNEj43oq/Cd3jS0UcFoD1US6KrDVNs98OS7UttuyAwwR6vb2zShRif32pM
         b/V6eHd+mykvXLoCshDFtLYdIeUFpvenCmkb/Po71LRKo9XP3GduyezkDDJkCzCWasq+
         Sl/QRx3i8yJcZaV7q8q6HMQSx8EMsuImpj6UdABrjgOa/MsZ89LIYIL+c8b1ywh39iV5
         58UJ3943SIYQsVSCU37mp1fxFrkTVX7+GE2UJy2LOb+1yiPFbVMZjHp9KZzwyJ1PDGG0
         Xcdw0VJZFcalQj30iSBixhUMRmNYFAk++yjjDkc0J2dbIHI2yS9HiXWlXvOxsx7TZ8Jd
         PpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733934591; x=1734539391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=osyXKRqUv4PvfNbOFslNjYYNVIaS0mD+W2/0VCKnb7I=;
        b=qZWWMvjnE5kUE2v7TqDuYIxRUZpiAm25KcWEFBmWBL+ETSoUd0lGAjn56uY6geMJuF
         PJMcNEWVAsi5b/3bUtTJQgboVEh65doSwhao/2CtbmN6WaejAy19kgrrsMrIGPGls3k+
         Oix5t4O4VaUK+3Q69EZiVTrTCMHX7Qj+fw+hSYznWdJX+QviUvcIgGGJuJa3FNsQ7Qdn
         +tU7NxJ4MHj7vh55gyzK7+ADmXnRREzWoGm1/wjJ0q5djJYY0Yid1Wfq8eGirKZCr/XA
         m85aygewS0hcRZgMVRmPR/G93UiplHkMRrCmSckskWNiqwdgwE46not3zD40qt9ntynw
         oNsg==
X-Forwarded-Encrypted: i=1; AJvYcCUSGcOWfF3szThUS5BthFfgiUeiSWlnpeIF/FPsNI8vGFp0VJu5mWBYPSXMRh9d83Qsnnw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdoSENRHSAtMXMAqXPLr7VVGvqrAb8XlvfU5usnVuMn4tBKiQP
	BtklcuA/jbyQBPkGFq5TjgvzQDH45b+znlmPxbMdyrEvaV01lGTEQ3uwUXWQceTmZukqbKokbAQ
	baagLzYgm3oAKeqoVlSjrRt/C3xw=
X-Gm-Gg: ASbGncus+xnjgIXkKhvdgN7TLahnAakjbhQF4brqGDB3YaGhZZKHek42QRttIt3VNCk
	LIKqTjq+Ey8Q+3N+kBhx7dCGGkhkTbMK3XayAuPmGSvsb4aQqDFM/6QcKD6SWIoSKM30=
X-Google-Smtp-Source: AGHT+IGYVMJ6W3ctYMQ7NC8ivi8cFDMpjmorS0+eO9pMHQYMNw+7Ad3Tj/sNuMyEstWHwoEfJ1/yML70vfdfCV99C5I=
X-Received: by 2002:a05:651c:221a:b0:300:2c9f:ac51 with SMTP id
 38308e7fff4ca-30249e0465cmr677441fa.2.1733934590663; Wed, 11 Dec 2024
 08:29:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241210105705.116116-1-festevam@gmail.com> <yujvdu3s6v7z7th2lrdscqfxocx2zy2u4owakisvnjppz2udqv@5ok2rcf4exd4>
In-Reply-To: <yujvdu3s6v7z7th2lrdscqfxocx2zy2u4owakisvnjppz2udqv@5ok2rcf4exd4>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 11 Dec 2024 13:29:39 -0300
Message-ID: <CAOMZO5B3810+4RJsPUtL3ASxqpDd+UmC=GcY6t8-ad7NZXZLjQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel-lvds: Add compatible
 for AUO G084SN05 V9
To: neil.armstrong@linaro.org, shawnguo@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Neil,

On Wed, Dec 11, 2024 at 6:31=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Dec 10, 2024 at 07:57:04AM -0300, Fabio Estevam wrote:
> > From: Fabio Estevam <festevam@denx.de>
> >
> > The AUO G084SN05 V9 is an 8.4" 800x600 LVDS display.
> >
> > Add a compatible entry for this LVDS display model.
> >
> > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > ---
> > Changes since v1:
> > - Added devicetree@vger.kernel.org on Cc.
> >
> >  Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Would it be OK for you if Shawn applies both patches via his i.MX ARM tree?
