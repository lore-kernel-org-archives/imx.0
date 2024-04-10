Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0322CA55
	for <imx@lists.linux.dev>; Wed, 10 Apr 2024 01:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712711235; cv=none; b=L8NerPqiMSYsxh2W8ewav3G2fG5L4iWNfk382ng1zShCLC5NYqJnwMZTymfOedEPLU5C8COab+mjlyGMyUY3BiDiMGZaoleHjbxgn9pBCzTsJiDrhNZP/owM+65LR22i5PUOkA7Qo8frvLO2p0r9ZgoqgdyGRlrPpHaJqsLtKAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712711235; c=relaxed/simple;
	bh=qLm+VnepHhI+0yQ/tu/mdPDhXXh30RnD3IF2V76MbZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hMRNqhV2TIS1+xqsbRMdMnLPOhgEEPTF31QYVO9GWHblBEYJEQZZC3h/BpfhX/MM8vt1n9FzB7ADBiCXMHJDDc50NnxsiHe4pQYaijVXp+gr0Z4UZa14ucWRwzqodIlz9GXXf4uQgjiccqH6nosHTImvqr9+BRSf5WSsCWrqMDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M73dc8ZI; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M73dc8ZI"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-43477091797so90971cf.1
        for <imx@lists.linux.dev>; Tue, 09 Apr 2024 18:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712711233; x=1713316033; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnUy9Dgxuu/dnE4qVLvSmNOrCGCLASYP8tq9YkPoGpw=;
        b=M73dc8ZIKP01WWA8VtSxNtLnc06/17iZpQap0r1Qpk31o9JgiDqSL73YYLYqLVstbT
         VtdkKtmge87+Y2VxFjpoHJRvXOlB0b/Fa8wQj546/Ehn5m9WeRTUPHIk1xP0gJcnWZGb
         +guZDdDHP3LYq2UueMJYXWB6sfZ1wHidrRDPipHr3Y/7fOHmtMh7eUYyL1+/mGkSgPRF
         N0uZ4Fd08ggmVdLCgE91aLkpZaAKVPAb8LPOGBATfSBoNeBJ+46ZWtm1chay70pqZjFg
         uqenzyUMA7uOP6YWFicGcN5wjCTbmI/6u6S2ghYCDq2lHtLGsJrpwsV+Q29yB1QEw9n2
         CMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712711233; x=1713316033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OnUy9Dgxuu/dnE4qVLvSmNOrCGCLASYP8tq9YkPoGpw=;
        b=A/7a5s3BhCEokT3qgNMrsdnJdyI0xVVj66PhCq9W4aaFMt7zJR0U1fzik/uYIUoTwd
         yapw28FIM8FCJrxhbkOWyZTpFE8fCYc6LXuG2WQ9Unh5IShcPocnmPT+/scr+F6Fvyi7
         7kY1RA5OdSUBttrRnT+93oOLrDOt/yQBDA2v8YMOH/OW74JzuTxLflQ8xYafGwWOkBnp
         KtVS3ajbJluNjWiPavTnozfO84zJjX6osGNeOiyowv3NhDAVr0aAkMlm6b28sNZ9ckmI
         zZwgvjq/bNNYED+ukz7B8IlsNrSusTdYO423JChYnOXMvGEr+EdCqO0xiECWjTROEpNt
         3iVg==
X-Forwarded-Encrypted: i=1; AJvYcCVq4Ez+PaycRhrHl3yxlSs5J27TrFjUXPyqzjEpChRvPFtBNFH+H6LrVC/+d0cgMAJlH0dTytg1aVjfEfm5qi5tl1eP
X-Gm-Message-State: AOJu0Yzs5vvl72796ytcU/pqggDX2Jpu4F5rLxYEAJmUCx8QJzD0vfF/
	zkoMCFN0d6j7o4a019mSxvfGKP6pv47s3iDqdMTbXaO+cN7G/TbIpJTWsON/SbzNbJ0zo4oAwk4
	e2OgwykdEEYA9HH292uIUHz7VQTymSjRNAEpg
X-Google-Smtp-Source: AGHT+IEnYGYE7m3kixf85CnlpYGzZvRPhp8krudkLaSycG1wisGydnCUIvWGp+zYdJGwFxhq8++4pWL/y3KX54K3Dyo=
X-Received: by 2002:a05:622a:22a8:b0:434:a690:e328 with SMTP id
 ay40-20020a05622a22a800b00434a690e328mr77260qtb.17.1712711232788; Tue, 09 Apr
 2024 18:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240409053704.428336-1-saravanak@google.com> <20240409150247.61e30a86@bootlin.com>
In-Reply-To: <20240409150247.61e30a86@bootlin.com>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 9 Apr 2024 18:06:33 -0700
Message-ID: <CAGETcx-Yxtkdfytsota3AciS6M9UeOaKSRtaHfH5pm60KWVmJA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/2] fw_devlink overlay fix
To: Herve Codina <herve.codina@bootlin.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 6:02=E2=80=AFAM Herve Codina <herve.codina@bootlin.c=
om> wrote:
>
> Hi Saravana,
>
> +CC Luca and Thomas
>
> On Mon,  8 Apr 2024 22:37:01 -0700
> Saravana Kannan <saravanak@google.com> wrote:
>
> > Don't bother reviewing this patch. It needs to be tested and possibly
> > refactored first.
> >
> > Geert and Herve,
> >
> > This patch serious should hopefully fix both of your use cases
> > [1][2][3]. Can you please check to make sure the device links created
> > to/from the overlay devices are to/from the right ones?
> >
> > I've only compile tested it. If I made some obvious mistake, feel free
> > to fix it and give it a shot.
> >
> > Cc: Rob Herring <robh@kernel.org>
> >
> > [1] - https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8=
x6=3D9F9rZ+-KzjOg@mail.gmail.com/
> > [2] - https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/
> > [3] - https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
> >
>
> I tested your patches.
>
> Concerning my use cases, they fix the issue described in
>   https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/

I went back and looked at the example. I'm not even sure I understand
that example. In that example at the link above, are you saying
without any changes to upstream reg_dock_sys_3v3 was listing it's
supplier as i2c5 instead of tca6424_dock_1? Why wasn't Geert's
existing changes in of_i2c_notify not sufficient? Looking at it, it
does:
rd->dn->fwnode.flags &=3D ~FWNODE_FLAG_NOT_DEVICE;

Which should clear the flag for tca6424_dock_1. Can you help me
understand why it's not getting cleared?

> But not the one described in
>   https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
> A link is still present between the i2c@600 and the PCI device.
> instead of the i2c@600 and the pci-ep-bus.

What do you mean by PCI device here? You say the same thing in the
link, but I don't understand what you mean. Can you clarify what
exactly gets added by the overlay? Please use the fwnode name in all
the descriptions, even when talking about device links. That should
help avoid the confusion.

Also, if you can show what the target node of the overlay looks like,
that'd help too.

> Adding the patch clearing the FWNODE_FLAG_NOT_DEVICE in device_add() avai=
lable
> at [1] on top of your patches fixes the link issue.
> With this additional patch applied, the link is present between the i2c@6=
00
> and the pci-ep-bus.

I know the problem with this patch series. But to fix it properly, I
need to understand the root of the overlay node in your examples and
the target it's applied to.

-Saravana

>
> [1] https://lore.kernel.org/lkml/20240220111044.133776-2-herve.codina@boo=
tlin.com/
>
> Best regards,
> Herv=C3=A9
