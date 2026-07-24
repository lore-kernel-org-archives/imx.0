Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF46343C069
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 15:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784908453; cv=pass; b=jAFMCamAk2O09N7FCXDtAWv/VI8XITpicAxFTqLuwg2scbJIIRfl6t2Tdhbi5L06mkzBb4qtHYTEAFSTflZl1kp8acv/4M560NclJ93VvUjXPoe1gzElpYOE+B0YgBMhlaQng3B3aZpv0KkfZpWgRo+sjZ18jyLPgAChKJrtaio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784908453; c=relaxed/simple;
	bh=ENUPkRl79pEx0BA0+dcKj8PnBBniGh5LL6VfEya2P3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGl5Zjs+1zA2xHAzZZmfrVC2OBrI/TicMum6Rsn1VgcfVbk/3XJzivFEHLh3gAKKsUsPydLKKcl7NC53tex+cTOfdafkfRpHeWUOCtq69Acug6q2ztCMuRKjABANRpf4cCsqeJ9ZGf1p23SUKTVgn/GC8twH1feFXnKe/fyBZkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ctgBa6Be; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ctgBa6Be"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c10ed63c0so236931cf.1
        for <imx@lists.linux.dev>; Fri, 24 Jul 2026 08:54:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784908449; cv=none;
        d=google.com; s=arc-20260327;
        b=IQco/Pw0Bjjl5Fhksq3SPsskyFhYVmCC9l/TDLV6E5/m9cBpl1TCKStqL4Eap2W+GH
         ZK8X1vvGIvc4vHHsjgRCiAuos6RuxOP9t9RpbJi0DxIhlIzeEunvoib7K7UD0HXjPudl
         0/p41XlBhF3AyP871hRI+4hqf46JJnSEjtUi2E9uWPE0CNLWm2Lj7sgH1JBtFuwJLWoH
         brHuITc3FdoiMg9t5UjxOeuH7xBuKcFofMqhSJrBvMNiy2MFIeGsGtI2BvSux67P25fb
         +KOciUgJGcLBnLnSIikiAwWMou1vXzwqTOy/Nc/KNJESm9zgZQi7v5pt8Yf8/8K0t3RG
         9aug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RK+0ydkVq3QkQA31vNi6A6UpE/xnLiLeTaBJXi8dr9A=;
        fh=gApUPJYWazxbm7PTrxUpQrI1WnCuoK5oTKFqDhLBfPw=;
        b=qhXLn41epeNLnlLxWucyvtiDZXf523GQ4iZWSvq5q5ZEruPNyRmKW8RzP0ClsWYj6I
         eqVozhTrDYLTii8aHToqT2jPbhghTdiNUbAxISBqMW30FJpTy4dTgYiVfLCzbvkmZi0a
         FFKYtariUsLdyUAW05psQ+8xO0lcKMXJeKvbHuH1lT2XfKtSz65PCsi8ihRBGFYJwcER
         hfru4DhZrOJROJFrp+M1bLvPkbAQZy+R2sZEl4yNnf52m+VX0BjT8tti9j9USdVU3McX
         O+GqHQGzgmkye+EQAH+LgUj4nK1icyTkaAWDpm8LayQa1lZEqE2o6iNM2gtNWj7KWgBu
         E9kg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784908449; x=1785513249; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RK+0ydkVq3QkQA31vNi6A6UpE/xnLiLeTaBJXi8dr9A=;
        b=ctgBa6BetNbOTwzzBRmK1T2VeHgORmGgYnt/byssmqkJHUUUPUaBM79omWI4r4qQhe
         vyhzvnNMU4Xf/qza961hGnitUhYYw/e0Mmv2n2cL5diyevwBQewEKRNx1QJgGNqj110S
         qxIsGKwZprjxJvQ1+HLSKJttXcCOAmbtCTgisSrKYMCVQzoabUZnUzk7pH5wJdZne2MK
         3IECw+UDXe+w7oap4jykJFL8ySRfftuygbj1Hdy742Z1kSmnx1UCJ8ILqpz7GfCLIzBB
         KtMd8bCmpHfftI2sVHzbySv1V08WQb8n9+o5N95eCvA4SAaciDAnqfsNHr1G+rBUEaTr
         I6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784908449; x=1785513249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RK+0ydkVq3QkQA31vNi6A6UpE/xnLiLeTaBJXi8dr9A=;
        b=iqhKbM4D4MUXGijzqV2+4RH+kqMnwUZU7DEUmXjkHrt8sj7kBiWlxpfpfjQXHvLgfP
         0MYn75SDG1W6xJ/O/yrQyXaD4cWDYceeNP18QHtoPxkokAew47vr+hYTwke1kwCMaBIo
         yMbuECl39YQuh/SnpPiyK7oXCzOXAV+lRx90sc4o2Y3WhvYo37xpcW9xui8WTjr8nQvs
         /iMOL4+PBDl7jL4+ppAG1K4vGEADfHiZyLgIO8+HRTtJ24KsP/rH9WYe/DEaUfKRpkfV
         39U3P3LIBtocs4TFSvdDuYzTore4+U8pnXTwgTqzejtOD2jlGhFZLZZdTnkovDiTWNET
         S5JA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+/1Qi3nvzq9SNlCCXJW80BYIjD9WpZLhSegYgfrTWw2Aehm3KQLhNvNx0LugsmiImUVg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJEtbE+eKuY6bPpsQpB0CoqWIzP0shmm6EPW6gFGAuZhSEheOI
	14mRwRZpLW8uwYppXihv+SX1l28Ah+SonpXX4tuXmQ6lOEGKqjRqp5RjWbkiRNCvOwNRWMS65Dk
	9mBgsqnayIPEPldCSgqkZS9KkOpsMAC4ryKlBqqWn
X-Gm-Gg: AR+sD10XnjDRL8fc5pVdrPA688i1+h1AVXcM33VOmY5k96Alkc0IJ+B0ngulBomqpau
	GnUYxhBhSe5l0lersnFR8sUZpEuaNdSuaN/C8AT+OTex2GwAwSH7TOyN1KwSkAx/b6zkI0bHupB
	oSmaUusCx8xqBLkfc9WkgLdZlPt3Z+UYPQmzc9APva/pkEihGA/Cu5oRVL3cPiSTjGdPyM+QrP6
	dy69yx+K2KfaSYRc8ukyiufdmd/S7K/sXnIic6pdx10+e4YDD+faqJT5Xg=
X-Received: by 2002:ac8:7d47:0:b0:51b:ff0a:2048 with SMTP id
 d75a77b69052e-5285229262bmr9058571cf.3.1784908448716; Fri, 24 Jul 2026
 08:54:08 -0700 (PDT)
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
 <12a46993-82a5-4109-87fa-61b8fcf764aa@yoavmoshe.com>
In-Reply-To: <12a46993-82a5-4109-87fa-61b8fcf764aa@yoavmoshe.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 24 Jul 2026 08:53:31 -0700
X-Gm-Features: AUfX_mwjkzQa0aKFOYVTkcojOnlyLhgENNWtHi2USSUpXbUHkHbBUjoNeksPsS8
Message-ID: <CABCJKufoQ0fX797M01t7CkTgMEwNCELY1=ptZsxr=jWOR-KAyA@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 12:56=E2=80=AFPM Yo'av Moshe <linux@yoavmoshe.com> =
wrote:
>
> On 2026-07-23 9:21 PM, Sami Tolvanen wrote:
> > What's the value for the __kcfi_typeid_imx6_suspend symbol in
> > vmlinux.o? I would expect the hash value to look a bit more random.
> Checking vmlinux.o with `llvm-readelf -s vmlinux.o` indeed shows:
>
>   a488ebfc  0 NOTYPE  WEAK  DEFAULT  ABS __kcfi_typeid_imx6_suspend

OK, so the hashes should match. I can only assume that the hash prefix
doesn't end up getting copied to OCRAM for some reason then, or
perhaps the source of the copy operation doesn't have relocations
applied? Either way, if this turns out to be infeasible, I think the
__nocfi approach is reasonable in this case too.

Sami
