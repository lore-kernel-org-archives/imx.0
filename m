Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E243DB314
	for <imx@lists.linux.dev>; Mon, 17 Aug 2026 21:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003919; cv=pass; b=L3gB4KOTd5Q4j37/NfqeFEhRBHiWo/J5Ui3GP+Sn7mlShHh6j9z6YETZ3brjqPfKaVH243+FouArb2Q+yMOnoIHDY5rqQt9FQyzoPY9qsh58MIC9TXQDe/KZyDO2EUFqIbApnRONpk1G9iWRB6kXRfpgSVeS7lAPxDxzrPnwxuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003919; c=relaxed/simple;
	bh=CEdKirEq2+Q+UOHNlHEHrgKgh5UZWOj3QauTHmy16Wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CD1yBl6iqPbfLiIJYN7NdpWOIGPCcoMWltzCGcuHd3JVA5DpgoD+UGjdaqpQRDEiva7pStrO994V7x5Tt38PivnNrN5l7Sw/nDjdjceTiCCV7nuRHFt3A/y/HOAZfhdEl+G275rShqaz07MZc9OoWYvYJD4C3mL2szYqeuEvy7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tDAvT9tp; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tDAvT9tp"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6983d3dae7aso571682a12.0
        for <imx@lists.linux.dev>; Mon, 17 Aug 2026 14:58:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787003912; cv=none;
        d=google.com; s=arc-20260327;
        b=gzV2uAWiU1wRh1yWbp/4HJrgRb0aaRXrvYrg8Dtq67toQBNNocWZp3hwRoA6OGlPk2
         6h5rOw1iUEN4t4GJSbGETzdXI8/uBTmjOuIbEXuKxmMY5slo+FoZ0GQ+ciwc6jUC4Qrg
         PulH9L4hSb1ldJD1E3ebNZjkT8OZVDwMH9HFSz2CPUkOoFnwTtot83oJQQNzhmbNtIHo
         bwL7VPTZTpogGrPeFXJVUYfv9mDDPxBoZ7Yy9LoBCrUx7f108Fiw4sZlOE8bEWb9hT2U
         g2aPse1Z89WNt3V4OHiMbLPvS/QZJG86sbEZHYDhNwTd9eq+ndGgP1bXx+WP93bFSe78
         M/Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=okaAU3zYOn1hyhzNcOWFnCkDHyrXnj6mHvmxdNYRJ3k=;
        fh=A/rbfikDrkmdCLii+ftMyNwwijzvLPvbOBX4mI+hlaM=;
        b=UgpYH5uxWUpm2kaRo14eRmOmLMFVA5pwwHTjqc5K4RclXqtzDFrkG6sd69eoGSwXgT
         EVHoqQWeB/ZbIyyrQdSlE3nBDvj4mPPF1Ua0DHTep566ut+lko4Az2rEVJVPsyzZoTEI
         mdTcYt+GTbqamTrsWM/szvFz5fQYlOec/yVc0UD9ix07YF1HcynfmjHsyPgcVNU3ZAir
         v3pZ1UBu8SDvbgKqIq38YMsUljlJwuD+tsPiLnh2NOkz1Stszm/sY9pGyj3bsISN7rZM
         Ja375FpOk+Hzd3luthjjn5i8mJgyJGGRe/66CVZ1Gw4vtKl37vD5fKky4bi1OlixHZHi
         qfRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787003912; x=1787608712; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=okaAU3zYOn1hyhzNcOWFnCkDHyrXnj6mHvmxdNYRJ3k=;
        b=tDAvT9tpd5zyEdd17zJ8ylht2zphVHSs/vbGj0vnrQJHh9XlGYGOakZvcxYLur7t6T
         /f5KPQmm2mS7FdrNu+zXHoDVR6uePc1WAPanBMCV+gTSj94rLviCCl+YtnR22272UHSS
         2+cEzhPt5b2eteb6VgK7q8Mipikpheawld8hw+0oFqcrUhta4/qfXE0mQBSQ9mHM9dPy
         IW+e3hKONRi/VQ2h30VutUhy9jgZqbSQM8qVdzXUHZWKoX1JlmycBy53MUMA9sU/UD64
         Qs+rOL88q4MYGV6fuqktIckrJn+fEeURwv7Phzab/i0YoEmyFLEKdJbcVHDgANUI4H5q
         bUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003912; x=1787608712;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=okaAU3zYOn1hyhzNcOWFnCkDHyrXnj6mHvmxdNYRJ3k=;
        b=CSaMIJqQqXRbhLJMyw0CrzjxQqk+WCGFUqrx4G3Mih1KXuekMfCiV4zg6gq0j5K6m+
         gcvJ1sxJrrpkK96q0lb7kkVTHmowLcEISdLy9yVvuxBEEU8iNWptTmuTe9Fe+MuT6Png
         6+o+1U9dXRasCAsfBJwUVrpcA1GbLqRoUkS3iJaYjJgHpI3hqRBwGoLF0g2yXKe2b0Cs
         SaC37ueqVG8cIx761z/42uApHr3d/nG9XIR7won+fuImTKF+CsBZv+WwxCxUhlBPN2an
         ucr+FRquNG8GQOLflwb+vne1kLO1gxVeMUBoEXQ7aFYSZx08+gvSEtWz5iRYwlaLKPH3
         29oA==
X-Forwarded-Encrypted: i=1; AHgh+RrgnCrRrQDw0dpS4GmqKOvyVkNsFIf/qYJfre1ie4iHkQlEVMqtNpr99jsqqUrI1DSFfKE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw90NyyFVBqTYyEO0lmdmNIqQFT0HRS8M8ZbTzbWvooXFS6JGSb
	BoyUeIC8W5k6V6DVMSWvUJz64Yb75A4WvJz1uk7axVX5S7/0GDd1hxihCMgEOVBY/M/FmeShN/Y
	b7asrx4f/GPU8zXJKBDN64ZY8YuHCAeyskA7tsC/K
X-Gm-Gg: AR+sD10LGsJJfspHjHkXwCNBhajVNXOZt13lHQECcjXMhFbk4B5R4fDsc6+gC/zXHQM
	ROj8gt145w+h/KJ//l3JCQM21p1uhbiv6cP3pgcVL45Fb2Q0Z839I3BTCT9SzOq8blMQ2pxOwT9
	IFFyX56a26F/xOz6liY3nx7nfXIPHDQeSmF8MgwW9aaagfUejeL5CSbD55JTko+msqv/zmVCYqW
	+XOqb8A0EHGDSeaA+9PJe1FU3T4cRU20eX+R756uhxBFep9zWpGN+Ciqp+FR5C5hASz/2KPj7wl
	BZ3J+RWh36+3ml94atSskjruZsxk0SPbXvl9hSCahqs2JWPsbn4Y4p27FvS0M+ZHYLMBTsoCs9l
	VMUHFUFjH5b+l8LHLKnaYRCBpMEn0jcMx79OJNud5GJ7eoASuHQvF/nRS
X-Received: by 2002:a17:907:9446:b0:c0d:7c31:26a9 with SMTP id
 a640c23a62f3a-c218d9ba953mr40425566b.2.1787003911741; Mon, 17 Aug 2026
 14:58:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
 <3046e60d-509f-471f-bd15-3ce78c87500b@yoavmoshe.com> <20260721180950.GA3684684@ax162>
 <180001f5-bddd-4e58-8442-f7ef3c979500@yoavmoshe.com> <CABCJKufhvTxmVm8y7xr4RWWKsoZk0h8UGBnem+F5fknnimaqPA@mail.gmail.com>
 <7f273a08-b29c-4e15-b340-898b251efe57@yoavmoshe.com> <CABCJKud+GsBVv+XMTsi_4QAaTHo7jXD2Hyvi9wqKd7x3i2xyAg@mail.gmail.com>
 <415ffa24-a30b-43b2-aa6a-a1cde3bd4ef0@yoavmoshe.com> <CABCJKud9B8vB-J8f0HLHw6EgEKVWzy+Q1PrNxpO_6yCGtEyi8A@mail.gmail.com>
 <12a46993-82a5-4109-87fa-61b8fcf764aa@yoavmoshe.com> <CABCJKufoQ0fX797M01t7CkTgMEwNCELY1=ptZsxr=jWOR-KAyA@mail.gmail.com>
 <CAKwvOdnaOy-nyZ=8oLw4N-_hA9JZVdP2BhR8cweCAOhsy4VG6w@mail.gmail.com> <91cb0f21-e78a-4931-b123-937c6a01592c@yoavmoshe.com>
In-Reply-To: <91cb0f21-e78a-4931-b123-937c6a01592c@yoavmoshe.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 17 Aug 2026 14:58:19 -0700
X-Gm-Features: AcwNN1VNo3n6QqxpiSk3WE0KBl-3YmOc0Qs-sAl-zs64L7Q39Eb5f5vg2HrwQ5Q
Message-ID: <CAKwvOdk-JmqjhZWBiLjXTxKhEV+T3BAB6An+3Ara8oybmhAMpA@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 26, 2026 at 8:37=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> On 2026-07-24 10:49 PM, Nick Desaulniers wrote:
> > Yeah, Yo'av did you test further modifications that explicitly copy
> > the hash prefix? I assumed Nathan's change _plus some additional tweak
> > to copy not just imx6_suspend to OCRAM which I assume the code already
> > does, but I would imagine you need another change to copy
> > __kcfi_typeid_imx6_suspend into OCRAM just before the function.  Was
> > that tested?
> Yes, I tried that as well and it unfortunately didn't work.
>
> I tested Nathan's change along with explicitly copying the 4-byte
> prefix from before imx6_suspend into OCRAM right before calling fncpy().

Can you share that diff? I would have expected that to work. Perhaps a
minor mistake in your implementation?

> However, when checking the compiled binary, "&imx6_suspend - 4" just
> contained padding rather than the hash, so the copied 4-byte value
> didn't match what the call site expected.

How did you verify this? Can you share the command line invocations and out=
put?

>
> Yo'av



--=20
Thanks,
~Nick Desaulniers
