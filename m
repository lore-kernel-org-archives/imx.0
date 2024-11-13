Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAEC202631
	for <imx@lists.linux.dev>; Wed, 13 Nov 2024 17:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731520677; cv=none; b=qZrJMmHyadKZsFiDEsS0VPDnshYmzr+PMapgbl1lFeM0GWYZ3SJkDzX+QidxjMIaXsfLiiA/2q7B7cz+or2Bi+r+zxza2oBorj4b5yecK49YG2RE/hZzIu/y5QunRg1nYfOvlT7S6y+ilOhSLNYVDKivEQplqNaLcpD10Vbauz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731520677; c=relaxed/simple;
	bh=2+naAnEhlYo0y7mD9BWzUkdNhpan/DMW2MuKIQuEKRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qev7H/WF40Cv4fMRf9UOztiNfHWGVn7edKvbhKumZ7NfM9snulNza6OQ/piygtbBZHDjOzrlCxzy8yKwxik0FEsgyg42kOomci0khithuV8JH7Pq4NTnrOxePGu7HinmaDxggLFM/Entlxbq2/BLuuuCHJZg07y3iDKafGy6giQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDY+TkIX; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDY+TkIX"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso100880141fa.3
        for <imx@lists.linux.dev>; Wed, 13 Nov 2024 09:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731520674; x=1732125474; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+naAnEhlYo0y7mD9BWzUkdNhpan/DMW2MuKIQuEKRk=;
        b=SDY+TkIX/sEMdUVLHEROoR8VRf9GakJz25lCuSwIYnRXUzeldy5PfFxh+Qn6tY/wet
         xqRpiDoXEV64k606CQHf5V6qDBlWdyvfHF5Ivi8I5dwL45DWUqvkCGh1+lFJFy9o2fU6
         SIaeyR5BFQ1qNRqwS9FrUGaCMwrBMnuZavsEGcpzJI1HtuwPJDLLc6LDlyue4H+2Tj4/
         OoJEwptEVcVD2SvlyG6R0qBnPyywBUPY4boYBBpaHq8hDmDHyhmw61uNeRhEtH0ZekH7
         J2Nibdssxc0s8atFLnHqosjHuV7ieKt1UmSyx69rmHllUZ0o4a1zj1c+xSVLho4RbY0A
         b4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731520674; x=1732125474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+naAnEhlYo0y7mD9BWzUkdNhpan/DMW2MuKIQuEKRk=;
        b=bVABVkv5zrIWREiA2xGX9oU/acRSYfl3UK0m0ZlolDSe2fnjf9eqMLgcsKcYK5JShM
         pNquh20cs5mVXSJH0JFULU9uqlU5XgMNE4gX4dYiVI/IQXtEaHkq4vXhubMiawa/481q
         NeBbLyMkEe5NquOirg0tO8kcoFMaaDJmMmcZTU2dNO/2qOEiY2qNG3Z4ssJDrHcuDzXz
         OH/So9QNYsedvFQlsbGGZix1FAoX4P65uI9IfBvaGE8SmXZDbx0xlITiX1zAl8cc1A8+
         J/zEXGSgL6qsSaXGLJhi2fAPaLp+BokLB3EfwP+/18pgs9+NzwKXwXnTXCgEVK+M0fev
         kNAA==
X-Forwarded-Encrypted: i=1; AJvYcCVBW45F7NFiXHnZgasEAOvBhZDOuowqJI8svytZl3W6HTWa1XRDTSwa+gtNEHUJVz4bouQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFZW/myJH0GXW6OrT3gvsiPGjEisFBo1V/l3B5cjq0zyRkumkb
	2IaFLUgoOkj5i1LNvUzf1pYMINX4kIoHitJevMgn38XZC2bNyHMrBeurKFp1dk4nyKLtw3gtk7Q
	CIm1gfc+SAqXOYO/uEleFr5ID8UE=
X-Google-Smtp-Source: AGHT+IG+aC5tPt2yrdBuMhr6qpWwFd7aP0+osiz15sDwB3XQBCFR0oq0kfKom9cIQROfLPtslJmNhaeftR6G8xMCBkM=
X-Received: by 2002:a2e:b8cc:0:b0:2fa:fcf0:7c2a with SMTP id
 38308e7fff4ca-2ff202079b4mr141052341fa.24.1731520674006; Wed, 13 Nov 2024
 09:57:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241023185841.1183706-1-festevam@gmail.com> <20241024-pep-proud-d714705c9ddf@spud>
 <CAOMZO5BSZ4YAZ7Lqa3eGP9Wx=Ed7cgug==_UZqc7F57=XCJv3A@mail.gmail.com>
In-Reply-To: <CAOMZO5BSZ4YAZ7Lqa3eGP9Wx=Ed7cgug==_UZqc7F57=XCJv3A@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 13 Nov 2024 14:57:42 -0300
Message-ID: <CAOMZO5AgQxd2_gkcPSdhfSDArEEkBVvo_yAW3hdHVXtHH5FyAg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: timer: fsl,imxgpt: Fix the fsl,imx7d-gpt fallback
To: robh@kernel.org
Cc: tglx@linutronix.de, daniel.lezcano@linaro.org, krzk+dt@kernel.org, 
	Conor Dooley <conor@kernel.org>, conor+dt@kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Rob,

On Tue, Nov 5, 2024 at 7:48=E2=80=AFAM Fabio Estevam <festevam@gmail.com> w=
rote:

> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> Can you apply this series via your tree?

A gentle ping.
