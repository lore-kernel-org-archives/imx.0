Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D577614EC4D
	for <imx@lists.linux.dev>; Tue,  7 May 2024 10:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715078409; cv=none; b=OD8ia7Y5LtKehwpHk/yteFl31S5ODU4MJWAlxKULZVXBihArAWCoXXJA+t03KpUvqueUA9olTlJMtrVTVYQsh4qHVNwmZCSHMmwMq07p/Dswed8p9qfcNLY5QeP5oHnJkBLbIPxXD9bgdQkR9ir/nPFqRBKAGwVnwn05qfX4NVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715078409; c=relaxed/simple;
	bh=RVraaqpU90T9jNynBtCQENH1uJ2RcPjIHtQUyCKdwiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cVtwFUPYHbkxv1st4LUV/+eHYvnPZbEP3Pddw69v9jPTgjLKNxGqQsmFsJHHg11+e54x77H10UixsGBtV7WuAWfqQZoP7A1m5pnGEDhArFpRreRiuC8//p+WMVAD29BVMdYlTbrmHWoJqHU5tc/fx8UGy2Nj/Ol0dbSSfZsA1vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JrUAVo03; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JrUAVo03"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-572aad902baso13641a12.0
        for <imx@lists.linux.dev>; Tue, 07 May 2024 03:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715078406; x=1715683206; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVraaqpU90T9jNynBtCQENH1uJ2RcPjIHtQUyCKdwiE=;
        b=JrUAVo03JG7C3VBBmDbK2YdYjD1D1YpAPP2eLdGZUqm5hUhNy4FGZ+AcmMAh9bNJEF
         zY4nNTIrVJoVltayTr+3/z3qCcFYDWcKQhs1IYcttAV7DEgvokRADymmqOoqh9AFHt97
         P/vCkbUP1oV9LvV6GfEuLKa17iha6U+Zb3RoqgmEUQW/+JV4yqKHicJv2AvGnyrdRsq8
         SKoHzRGXcakFRxjsHkkCDAlimNRPBA4LczCUuQAEp9WG4ig/UHZp7dzUn0idcIHTNT6n
         GlIYKnvSiU4M6Kk/OyhQcqDJxeIOWaE/Lx5me3ihXBdPKdK7Yb+Hj0jko4Mm1OLR2moK
         xj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715078406; x=1715683206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RVraaqpU90T9jNynBtCQENH1uJ2RcPjIHtQUyCKdwiE=;
        b=FhyY2D534zM9gbuivogZLI1mLnxq1xRI8TwgvWDHXi5ZrbwlmnH3c94e4+R6jtgLYw
         3ZDgoSEXzPJubSbet4M4wJoqlFG8Y1Wypf5fxi7H1CLIN6zq/+RBUbaIh49z0cvBRB3R
         Gd76PxuHX8uUKCDNkZ2fZaVs5TN1wpqMUDwWdMON6Ea+OX95SVMO1SR9uXDTk4jfE0p4
         U+D3J54aEP89BkocTbHTSmlYnTD+FTtvJC3dB+HjOzy5Y/7F2GYArqMiP2KVVN+hlmnX
         VMFUZCGsETcryQNnGE0hPI8eMswV7/pQbam3H/Ogaz5r4yeYhTYpH7DyrCmAVugKY6Da
         +20w==
X-Forwarded-Encrypted: i=1; AJvYcCVvH9Kt37A9gSTxh6EGPGKE4RXm0yvD1/v6Xc+PFGenPnRdpRS4g6TVQvn2zVntWg5SziH1pAoJotB+tABtaIm467+z
X-Gm-Message-State: AOJu0YwmhVM5J63BzxtJiNKPWit4FLNZEKbFt+8abTNA4EqoLim0gp1u
	2OPPL0nSF6KbyAGNoWPmVIVx3oKzD5bm8cqGYD3NIBFyecrlpzI/9BYPlH8Iym/AyQ6zAU/RCkH
	df9YOGGp1vRUMN0utR8+H63VVk7EitY1jfUyK
X-Google-Smtp-Source: AGHT+IGURH+TAKjYVx7HNPEQu9fLSg4tmEpjWWFcBoWqrK3Jf56PPoCH0wcN5v4H9exUF8MPoXuFORZW4WZOvliX6zM=
X-Received: by 2002:a05:6402:35d1:b0:572:554b:ec66 with SMTP id
 4fb4d7f45d1cf-5731310fe6fmr162918a12.3.1715078405878; Tue, 07 May 2024
 03:40:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240507090520.284821-1-wei.fang@nxp.com>
In-Reply-To: <20240507090520.284821-1-wei.fang@nxp.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 7 May 2024 12:39:54 +0200
Message-ID: <CANn89iJuEubWMu4Jg3rAac=HM95U3yS9PSq1eSx+-JC6rhOdbA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: fec: Convert fec driver to use lock guards
To: Wei Fang <wei.fang@nxp.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	shenwei.wang@nxp.com, xiaoning.wang@nxp.com, richardcochran@gmail.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 11:16=E2=80=AFAM Wei Fang <wei.fang@nxp.com> wrote:
>
> Use guard() and scoped_guard() defined in linux/cleanup.h to automate
> lock lifetime control in fec driver.
>
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
>

To me, this looks like a nice recipe for future disasters when doing backpo=
rts,
because I am pretty sure the "goto ..." that assumes the lock is
magically released
will fail horribly.

I would use scoped_guard() only for new code.
