Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EB536F407
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 06:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772777980; cv=pass; b=DYWICrIgyvZfg39ZwodUbm5Rfyf1J6wHPk8Wfp57o7Hu6rFOHULbOxuMhyF1WBsiMo7sd0GMJtflEwoNRcrHj9lxphOyxbUVYrocglJcvg8Y/p2CdPOznFyWMWJct0ej6dt914zzaQCiNzRMovskQdwQXTI4dOUvWJRPuzQ0SVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772777980; c=relaxed/simple;
	bh=P0VGWiHF08Hb/LHLPzScyeOvbLZVakbt6uUzSBkPJkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VkgyJ0GrCnD1DyBpFcD0oSLmvGe7w4Fbi0cywlPQaq6+/ElArzYAAg+q4cClh/Yk12iReuyA9YmAj7n3kQSmEJ5pNGB8ujHxuZYNHpVwERmjt8iX+vuFvVm1DtGs3ULybkJf3MJBj/KdxU4ZB8kvtMT+lzNDpgC83QdV/gOgF98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHXQFe0N; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHXQFe0N"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b935b8dcab7so1396994466b.1
        for <imx@lists.linux.dev>; Thu, 05 Mar 2026 22:19:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772777978; cv=none;
        d=google.com; s=arc-20240605;
        b=jgjrD01QYZ3e6Xn4WX1KduNU213Cc9uLx1YQTuS4T74tnorPSCn2B+Vvi1HfuACcJZ
         Wa7x+3qBnhJypxEcFcy0hWNtU4lj6ouA80xc+c8I77kXg//Wv4EwzCZN5s9LsAua02RR
         BpwS5pCgffzhiH52UJ1tHZEBUipI8eb5GIMptmJSKqEz2ZF79QkqQ1RdWaHfAtr16KIN
         xjFR0XK4z4Nn4bDaISBw4ERM6Uqs5s7sR9b7r7E4i4L89fQezbxgBNzdQ8I+p/Kr/aPo
         ziU04nQmiBa6H7NH/uWzh2QUkIcL4KweYUW+YdxBNDcu3lI4n04Tpgtx67IdtPgAv/JP
         GkNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P0VGWiHF08Hb/LHLPzScyeOvbLZVakbt6uUzSBkPJkk=;
        fh=bPTN197ZULmXPz55HyoOzNIp9H94lMzTaAV55mrGXUw=;
        b=D3QiC0ZSr2CNZZ3UvjFXUSonc7cEhf3c+trjHdVSTOyadw3CMPNWZLr+eQJjMK9oBK
         6aM27ZC9s4ZOYS6K7I0TTEO6fY2Vjqg2RXXkv82/EM/Oiqte/wHV4jkI0y/LGtSISa/g
         9i79VWFZWcoLd9o+TZBh/y6t3JISBjU3vPVmbcNVkipS3gKrAoda7UD2+xpk/NaAz6yg
         nrpzxCMGI6yC9RS0k1fp30HqkC/EV9iBv7LF8/mP+TIri9gdlb/QIApFUC0yEtYHguIt
         ZjTexhOysZXXe4PZ3iAbx/NPduRUreU3Et6o2EepbsuNbYVB+1WwduKiV5OClCeRXf4i
         aJ/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772777978; x=1773382778; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0VGWiHF08Hb/LHLPzScyeOvbLZVakbt6uUzSBkPJkk=;
        b=ZHXQFe0NfcXsRzBAsq5GmZemvVmMDhVlIphJIH1gwzFXkcRx7DtW9tKrlrRR7vBxlM
         T67AVc4ngqxqOR4suG40aDI/fr7SUizPcylWg0LqszyQ59K6Z7C0nNCmM09I9Xa5p298
         jZSgR4vRbTXAAfE7kJhRc6so+Uc7vU+L3ma9wckp2/oqrOiSy6h4u8uDn8Ja5/pdLn8b
         t+BM8FuIBhoWIA6Jb+NIE7ExV/fcA8O1YOYr5jIp771RGMO0e+bdugWbBD3R0oFqw2dM
         E2c4HEpo86qpOjtm0Mw3TvNFAXwvAiQmAlILlItezOHjvEslcNwV6stUZYBpLiAVnlHp
         KP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772777978; x=1773382778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P0VGWiHF08Hb/LHLPzScyeOvbLZVakbt6uUzSBkPJkk=;
        b=Pq5Ts+fvscr7L2XwzlWnwSXygsjnCJ6L3Wa321qKHeyAqE3PZMGLZIK7yo4TzCUV5c
         D54F0Zgae0bcPAQYZBZBhxcJXjfr1nHeeGQu2wKfmQp46oQfCWKOzAVSRaXdX4q07L66
         eof2N/V57swl+U2rC687j4JOSyp8IDBgW0s9ShUGIBFUFqDu2p7bnwJswTXcFOB5BXCa
         QUHCAKN+X9YIPeJvMQYEtf2/aB8g2bhcYM8SdPL0C1IwMZv+ctWObahDymo94PNe+yIH
         +JgcZWEX3giMbR57t1Oxq8ljpUNkMcJztsmq4PZ3+2wezp1l3RLoCeY0OyOCFr3/ZqbN
         nnTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKyiL18fhReJodJs4H0Of+9hJSheEhYosL2wSYyDxiwtkyMvB7FFwzafEqow2oZi7Sgvw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtrypHa76w/a/IikNB9WINaaT54E+4+ttof0sqSEVQcVEwzuR+
	OCBpxNt4OQedGlsEFF8sXoaWvL8ZBF1FZfD+YbdXugOC+gt8Bs1TI5bkVJQNKpWX5/5mKOKsNHD
	qcS7HWFeu9yEb5ufuupt2P3oeqmQWyZ4=
X-Gm-Gg: ATEYQzzO1KKXrzQGeeXNPTVsnnYh1JgJFZ+8i8tBVMgppOjgsFWXgZSbLDLvCBOTNrs
	v3gSDSSL2iR0oO5oA7k4W/qiV9jFF/lJk2RIdKda/UIMYTGUieOnGpZrj7oHju4hAzC6VtzZX/B
	uxv6y53zmFZQuWy/UiGV4RsxwkTPchRLonbsfEPP9OIMfxq7sbaFr3kzSE9uIN6edd/7+WPbfB3
	NcRiZI9ONFS1VImXi1EGbrmHCL4A1FAJEHU6jlDDleueeIzo67qpQ9lYJ5r5wuEmB02NygQ05B5
	6F2btq4s48r4J866A6F+BvBL10/BQFxvU0FBLfsFcASCOO/ThwK3ZKuojY3dqfoyVkwElveyKnc
	juEHTfA==
X-Received: by 2002:a17:906:f5a5:b0:b94:244b:2ba8 with SMTP id
 a640c23a62f3a-b942df74e45mr44939766b.29.1772777977596; Thu, 05 Mar 2026
 22:19:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260306044536.149204-1-rosenp@gmail.com> <aapiBcnPHa3eDLN5@lizhi-Precision-Tower-5810>
In-Reply-To: <aapiBcnPHa3eDLN5@lizhi-Precision-Tower-5810>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 5 Mar 2026 22:19:26 -0800
X-Gm-Features: AaiRm50x7YMCKK1F6zYGE3uuqGNee--50j1jpnmhfHu0gWe_LApncHVHg97bcLc
Message-ID: <CAKxU2N9TyRe_o6zj5pNRdTR65BgZZ6brsgRuq0Oi1EFvQSCiVQ@mail.gmail.com>
Subject: Re: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
To: Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-hardening@vger.kernel.org, 
	gustavoars@kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 9:11=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Thu, Mar 05, 2026 at 08:45:36PM -0800, Rosen Penev wrote:
>
> Subjest: use flexible array to fix memory leak
>
> > Use a flexible arraay member to combine allocations.
>
> typo array
Will fix.
> >
> > It looks like pipes never gets freed anywhere. Meaning this effectively
> > fixes a memory leak.
>
> Remove "It looks like". The pipes never ...
>
> Because fix memory leak, need fixes tag here.
Since its inception. Lovely.

That had no struct_size AFAIK.
>
> Frank
> >
