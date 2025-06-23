Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B136727146B
	for <imx@lists.linux.dev>; Mon, 23 Jun 2025 17:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750700007; cv=none; b=YSQM+A4kfPj6hrKeapTyoqk/YRuPn3vQOizNHtepbqBeb8S3QgXOOV6pg/aUzhU99mlEwbVlmjwldTkwbkg09CFtp4JZVfe4lxIziU9wD4kvYyRL4RUnWZUyHgWGioSJp/n4qlYzgsrN4kad69BZcwAC2M8OwEcl82EkwjoWXeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750700007; c=relaxed/simple;
	bh=9ESxItapZGpeX27bCqCWykYCjM+yU4vTWbwqb34xOmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ja2xCneYI6rIiMHZ7/t7h9cx/Uy9qZ2jvH6TliuES+WmTaLiKCEVtexuyji4KTW4z1iFo2qcqOrCAsUO5jLYO+/EPM5dcWxyI0l2Vq7UqUkvD5QYZL2P/Sew/ZtXH6yYCOjonlRMxImDWSnVuuGjw2WbLo4+yJnWvJaimYXMjf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=omitYBv2; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="omitYBv2"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-605f7d3215cso2155512eaf.0
        for <imx@lists.linux.dev>; Mon, 23 Jun 2025 10:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1750700005; x=1751304805; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ESxItapZGpeX27bCqCWykYCjM+yU4vTWbwqb34xOmU=;
        b=omitYBv2o2qusOAed6FByaZ9WNbI4QOFBc41ErD6SJyFznhkLkoTd5UtpJZz8I8jPW
         nTODtubFh5GaEXl/uIKAh2VWD9hZ9BuqbSJ63TlY2Lws43O9jmwis5ivjNu8vsEWbwAW
         ocFlhSn/Vkhqpuh/vxcIRjg1lwlySEnzVTVqRT5VPLW+qbjzRXU1spYM49tpOfTG4YeQ
         BxjoadgPFaHBvzau+ctDqGQvRNqnN+qkCAfT0YtwISvv5wpxkGeUt52MLCdHKCji5cNP
         IBBkD9wZg9itzHHbhX3RSH7hi+7PkdTf/OqUG2Z6GstmJOgiAPYTWiiYm/ukSzjehB/v
         7q0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750700005; x=1751304805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ESxItapZGpeX27bCqCWykYCjM+yU4vTWbwqb34xOmU=;
        b=iQ5LqE4POZU0ZzADj1BCyMpiC8tjLAsJBDLpDxkTVHTC5HnZw0GKVfbSlQyzk/gyu8
         CW//QLg2jqXeCHyD08VbfFX1JJGBc4fNDTl4YTkJOWjGA4T7QJjP1+TSVmuUi0rDZGId
         jUcgIRSnY6ADN8rGo/9fikR+XI6d39j/nRQepqQ3E7yIpVhQ7HA+f1fVFLeHNUCW+G5R
         OA/QRwSCqSIen60Yw5MX12Cn22Z2Jv8hpa04L9Sy+NDG2gQ1vVqo15oLKwvtmE70S4Aj
         tjQCWVH0+ux/CHKheGFOEDdO5sKDOyiYYiMRPPWdTNGInOXk3QHlTyyZuUy51ihyf/K0
         ndLw==
X-Forwarded-Encrypted: i=1; AJvYcCXe0Xa1ziUR2L0B4RMygI35JshryyeJQZ6yx+2rlo099Qorwk7TdekD0qzuioZ1pYtAnT0=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb8Tf+lnNxqgkdnWB486YPC0OXHRi0Tzsa4mhBzYkUKL8K2aFs
	h3aibpHcoP6UAmVjxy6D+azBL4ZdpHAzmLqMJE954TOP64u4SmjVKUcdKAXstebAwef8s8f5Vwu
	iTjs7xRcJ+GJAr3gbwbkCk1C6uQPGhnwFx8S53NjXfQ==
X-Gm-Gg: ASbGncsCCAdo1GsBTTS5csNkRqlyPtRGlQhxn62deXLIpoghOnzWfSyaDTgB3oPgIZM
	oy1jpNkHW9ijZrFhj0y4Gizjx7GcPbaR5YHNnHgPhSWS15hTTN06TYZp6xH7LSw2/AYSiBtLl6W
	qm7ulusNeOuD02KbjGsNeh37oBrhoLqceuytbd4wxu6JI=
X-Google-Smtp-Source: AGHT+IEnQISZoeoPxj8JEGlUaibukW91WXz6xwGvL5sx8yj9FeldaqG5qJs0cowqWl1mZaAAU6aoFwKpwix2JbTKO8M=
X-Received: by 2002:a05:6820:1b07:b0:611:7f80:6474 with SMTP id
 006d021491bc7-6117f806825mr4229278eaf.3.1750700004712; Mon, 23 Jun 2025
 10:33:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250616085742.2684742-1-hongxing.zhu@nxp.com>
 <20250616085742.2684742-2-hongxing.zhu@nxp.com> <kjsaipr2xq777dmiv2ac7qzrxw47nevc75j7ryma32vsnyr2le@mrwurn6rgnac>
In-Reply-To: <kjsaipr2xq777dmiv2ac7qzrxw47nevc75j7ryma32vsnyr2le@mrwurn6rgnac>
From: Tim Harvey <tharvey@gateworks.com>
Date: Mon, 23 Jun 2025 10:33:13 -0700
X-Gm-Features: AX0GCFtnkiV6JnGTj19oSXnEDcUfrmPAyTPCGVHfXU5cEeF-T0n_k13y5pEP9X4
Message-ID: <CAJ+vNU3mKiEE86SYFS0aEabkqRKADFDJN0giX73E0cA=GOyhjA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] PCI: imx6: Remove apps_reset toggle in _core_reset functions
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, frank.li@nxp.com, l.stach@pengutronix.de, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 4:42=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Mon, Jun 16, 2025 at 04:57:41PM +0800, Richard Zhu wrote:
> > apps_reset is LTSSM_EN on i.MX7, i.MX8MQ, i.MX8MM and i.MX8MP platforms=
.
> > Since the assertion/de-assertion of apps_reset(LTSSM_EN bit) had been
> > wrappered in imx_pcie_ltssm_enable() and imx_pcie_ltssm_disable();
> >
>
> What about other i.MX chipsets like 6Q and its cousins? Wouldn't this cha=
nge
> affect them since they treat 'apps_reset' differently?
>
> - Mani

Hi Main,

This patch effectively brings back the behavior prior to commit
ef61c7d8d032 ("PCI: imx6: Deassert apps_reset in
imx_pcie_deassert_core_reset()") which caused the original
regressions.

To ease your concerns I've tested this patch on top of v6.16-rc3 with
the following IMX6 boards I have here with and without a PCI device
attached:
imx6q-gw51xx - no switch
imx6q-gw54xx - switch

I only have imx6qdl/imx8mm/imx8mp boards to test with.

From what I can tell it doesn't look like the original patch that
added the 'symmetric' apps_reset de-assert was necessarily well
tested. It started out being added because as far as I can tell it
'looked' like the right thing to do [1]. You requested changes to the
commit log for wording [2],[3] but I'm unclear that anyone tested
this.

Best Regards,

Tim
[1] https://patchwork.kernel.org/project/linux-pci/patch/1727148464-14341-6=
-git-send-email-hongxing.zhu@nxp.com/
[2] https://patchwork.kernel.org/project/linux-pci/patch/1728981213-8771-6-=
git-send-email-hongxing.zhu@nxp.com/
[3] https://patchwork.kernel.org/project/linux-pci/patch/20241101070610.126=
7391-6-hongxing.zhu@nxp.com/
