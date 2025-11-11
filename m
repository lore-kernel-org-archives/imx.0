Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672303246F1
	for <imx@lists.linux.dev>; Tue, 11 Nov 2025 12:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762865250; cv=none; b=XEwDbqupYFKmYDnZpUKIE2Bwy+IB/ishznue17U2WZ8FRSVVzicAREpwUBUiQPMA3lAl/PgGT4Ufq1flyBCJC7TxWuO1FpyNCgEOb+URY2pzrIlVp/lEdcScSixhTE1ZDzLii+1X0nPtZckemWt3ut9fa15rctHBOcuiTbOSlsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762865250; c=relaxed/simple;
	bh=DiyCVpW74AzfmSw2woljowbltxeP4f6oP4DP84zte4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tJ+KhPrsQATnhVFAcxzEEGRnJ19mSX1gj+cfhWdEHXYjIgZmQxR2LwITP+vbfZyGIF+j905lLo5Em8NF7HtFiUsG4+YL3wMCKm9LvzS94XTOfAO8A7ruhdJZIVPedq91VGsPaVSaWv3CPdYvxS0n+eU/fhPmQj967iR34bVHnno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npUXjIPC; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npUXjIPC"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-298039e00c2so28745355ad.3
        for <imx@lists.linux.dev>; Tue, 11 Nov 2025 04:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762865249; x=1763470049; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiyCVpW74AzfmSw2woljowbltxeP4f6oP4DP84zte4E=;
        b=npUXjIPCURW5ZmOeQsKMdlJkxfkSkTMp1WKcpEY8acIG/IAbu/pyf9MaNXik3YuntZ
         UlCqv7w+w/h8iVJCBZLYno8Zpkfkn8nXXNK2NEcOO0h1wpzhzgGs8LuSgDBYFBc95PEO
         S/UwFsRgiM/fb6G6FIdJVFg6l181ama+9fcuKX4PLH+ZYCV7CbrjaLW1g5mvpotAoa/b
         VyE9G+0qXyn1NxyEnOJ0xLW5Nnu7V5KQqMNNB4aMy/URG5SpvHDGdiNZoYgd6HLsuryP
         poWLuetTQ1Sd4U+Dar+EcmpNaP/qXecdvCJtv38GFg2yTwEvdKeqFE2xuP0y+U7fp39Y
         xZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762865249; x=1763470049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DiyCVpW74AzfmSw2woljowbltxeP4f6oP4DP84zte4E=;
        b=g3kazki5go4+V8US0twXEQOpcI9Buizc6cMFRUGH2cDlNGns7zf3fh8n1j8EnY75bR
         PNtjX1cgsEaQGErFEYXMNQUBnsk1OmI1Pi+d6wNjJf7I9lURghTnK4UDJEHyHT/srx11
         uRD6utaBEf/kXODsZMASYkG4K2VKTkpeGUDUJ7sG3jFcst7Uxm1Exnmm7kvhD3OmdBGa
         0I45D02jpvPaJoeqKcyeG55hFbhGTDXi9GbyiN3TS1vM4hC6KQRJDqrRfyOrA4p+hZtO
         XhODaBHgocOpyqp9gq4ayl+pvka4XD6pdt8Hl2K9JPUrnxVZCq5/r+LF1+CqWH+RcE8j
         N0Wg==
X-Forwarded-Encrypted: i=1; AJvYcCXu6/wRycASGfZ8cn0mq78ZIS+7amsSTbCBT69/OmoA1/LhT+goSlJb6VUz9wrHteT4uy8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxkWke7h6UJmIraTfXetO+pdLevZFleand8i6BhAOox0iZ5jbSt
	z4MLWErV3f2sUJ3XGg5yqNWjolBtQzydnHC1vUtq935CJde91YNqwEV9t3nmCAZK9b2H1DeVZZk
	WRlLst0N33d+0ULbksNcT6IypdIJTSyU=
X-Gm-Gg: ASbGncsTK4c0gaQSN5Hz/aMLf82EkU1RG2Lfybsr3joIknLJB3Cs+v60LOh970zq6vi
	gNDlR1xQbgjx4+B0GaPHMBZcRxlD3fG3QI0RcI2Wrpu3cSKSvHJXaOOXXh9dqbRUsR06ZlgWbSc
	jj1+0+z1JE77Mb+QoQtwzG4thzkAk70FXv8StBEPSex1NkcZDYKysO4BI57SYMQI0ek6Du0/hnf
	DWcPcx/T1aW64Y0TTvd67/Z3qtJnri9K6tH3WKLclfbzy/oJXXWfWdbuQ==
X-Google-Smtp-Source: AGHT+IFJOONKkMfXdqPbe11hbjBNE3dvsWFF9H5OLiJ4S3DIHKfijXdDtwbm5zbR413VDlyjBE1eFW45EeSLVlnkRWU=
X-Received: by 2002:a17:903:2b04:b0:298:43f4:cc51 with SMTP id
 d9443c01a7336-29843f4d1afmr23812835ad.60.1762865248764; Tue, 11 Nov 2025
 04:47:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251109214515.121742-1-rpimentel.silva@gmail.com>
 <20251109214515.121742-2-rpimentel.silva@gmail.com> <9d48a54c-0585-4524-b9d5-30696f5ecc8b@kernel.org>
 <CAEnQRZCvpXzGt=7NGv7-s+y0gvOg7Jx4OqbfbW3uv8jDp-jroQ@mail.gmail.com> <CAOMZO5CU09fcBB8oUOO=qC=Du3Q9gnJOQacK=6v+pnSQViex3g@mail.gmail.com>
In-Reply-To: <CAOMZO5CU09fcBB8oUOO=qC=Du3Q9gnJOQacK=6v+pnSQViex3g@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 11 Nov 2025 14:49:49 +0200
X-Gm-Features: AWmQ_bkTj9C0dCRYaaW6vS8S4HAZCMkKvqfHh7nxztfpxPDtGEV8r1QKd9FonHg
Message-ID: <CAEnQRZCHKemw2YVT=WVJvUMr9CCWoZ3MORt_mU1V-62C53n-3w@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
To: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rogerio Pimentel <rpimentel.silva@gmail.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, 
	alexander.stein@ew.tq-group.com, dario.binacchi@amarulasolutions.com, 
	marex@denx.de, Markus.Niebel@tq-group.com, y.moog@phytec.de, 
	joao.goncalves@toradex.com, frieder.schrempf@kontron.de, josua@solid-run.com, 
	francesco.dolcini@toradex.com, primoz.fiser@norik.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiaofeng Wei <xiaofeng.wei@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 1:50=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi Daniel,
>
> On Tue, Nov 11, 2025 at 5:45=E2=80=AFAM Daniel Baluta <daniel.baluta@gmai=
l.com> wrote:
>
> > In addition to that, Rogerio please read:
> >
> > https://docs.kernel.org/process/submitting-patches.html
> >
> > At this moment I think you should keep the original author of the
> > patch.
>
> Right, but NXP makes a total mess with authorship.

I cannot disagree with you on this, let me clarify it internally with
NXP colleagues
and sort everything out.

My guess is that when the code was released via the meta-imx-frdm Yocto lay=
er
the original authorship was lost.

Anyhow, what is important for me personally is to have upstream quality cod=
e.
Also, in all fairness we should grant authorship to NXP people and follow

https://docs.kernel.org/process/submitting-patches.html

Thanks a lot for all your help and effort!

Daniel.
