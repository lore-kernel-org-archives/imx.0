Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEC02882D7
	for <imx@lists.linux.dev>; Thu,  6 Nov 2025 07:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762415483; cv=none; b=hWt0w7Qt7IjsMlJqVLmkgfhM+xpCIfRczPff7p12/iDD55EVB6N3WfZH5660YH2xwEmtSe5OYeeewlPQCEJETHjGc6re0shHgzvHZHSeBvvshTtJRoAd6iUAMU2hdwvP8LuPvT4heT6GktoiPXxytInH9XlY3Xh1iRTYC9PZkuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762415483; c=relaxed/simple;
	bh=V3okf9oIEIU43qw5xYW1BwiN1gJLrWq2sN3TplwqiZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lTXxg8kULkM7wRIJb3rcCn4M8HwrbBYtX7vwQHwlf0REgNpZRvqdEG70HWmlVnFPRHz6xwwKenBRhocQRxLdtwuKVNxKIAkdMxOzp4bv+L3YeOGYPLXP2kr1f6xThuJ1BmDsSsJCB5nyzWOtrw8OSRnVA7k6WIRcRUySM+Cl570=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HFOZucW9; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HFOZucW9"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-640ca678745so1196709a12.2
        for <imx@lists.linux.dev>; Wed, 05 Nov 2025 23:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762415480; x=1763020280; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v7QbmE1T84ff08D3+wx9jlBrqSs8DUW5Q3gCIAzKNPQ=;
        b=HFOZucW9DR3ARW6Apf3vStHyhy2aGEP+tUWqrCii9pAlph8PRG80LarebaMr7na6cF
         mzUj9soDCOPEYjAx3SPMJQcID6sQTHNLOM3wFXiCOd018aZPm1RRFV6KaktfZOsDkJhA
         p1mELDcvSLFoaq2v5r2YAZTu6+UH12KKgiaWYxjt2aWVL0YVBFDhkuVupOWTfnLfOIxS
         hTvXuEBm8CNg4YrqrPY4Cw9LdTtVvDglV94jOsC0hIMXJlOKnb5j573MIU+RWcES+w0M
         8zBgaBDIDaEvwas/kPDfmrOgZdhKfOgr9iDQYZw6EkMs4xu3DnrscGU3MAXsTECnTjtv
         B9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762415480; x=1763020280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v7QbmE1T84ff08D3+wx9jlBrqSs8DUW5Q3gCIAzKNPQ=;
        b=LEo90bjUHcPmiQduf3JPAGgnaliCrnQa0szeKwqyMvRhA1LYeBQ28Nr/O+Bz1RwmNG
         ZbhZJizVBZMnIj0S2/lQ1xJOJ18HCaA1f/qISFIeob+6T0ZHJn4H+wnatalP76xb1fwb
         +PT6zZQaSjS8iLVBeGWGmltrI8jaPF9s7lrMDcvt+d9HTNH+QveFjiE64eTEKjqrPtby
         uNbkmf0P2mEPxZIeRaoqgPGIrHmlOM02ZRW3ya1oTFMIDh0C57wQA4vxcRgnt50JtDtY
         nsZM67CEfV+ZuxMU6+zMgLJLiPSkswRa9LXWBIEQTSxhXsZ9T3uirMuVeFpyi8l0Pxxd
         JibA==
X-Forwarded-Encrypted: i=1; AJvYcCUAsXQMju8Br2rOow9/Eco6iR6WoKxcTufVktxTI8lcNXzd5dUos5bIXnhsUV54rPEgIsY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyN5Jo0Of5QJFctiC40G0Yusvn63zW3vkHp6nZKT+JU4wbUQvUJ
	cHVpZVz4j+lPFPF8dfH9AReSEm+9kVKm2L5s98qivLypN9CwJICuwy1/T9Ps0934pw0yS5+kjJg
	9clYoK8XT0for9MNt2jZzBnL8PDKQQB9VwewDrD1B+w==
X-Gm-Gg: ASbGncv43Ldvs7vn1LXN8P7PDwiY6tiq4KGxpxopk+0WJv8Kwoumc9fDNXPdNr36TBA
	ELsJaG7AZEpFw95VrzGZ9537ZrQRh2ryT/xxuQ+Hb7mVWR2GS0onAK4mhDizyQkwDZVqSBWEuOo
	5lrwZJ6bWpQ2srz4Kc+njc70wXeLChDMNcCKqcnZOm2xvvep2YdWZxtV7VC1Ju6V/Lt+b77QTMp
	aUPwEyt+P0wAaLSdx+75jn8xK1miWR74in8+j0rJf33zExcnqDIRioouXXxQw==
X-Google-Smtp-Source: AGHT+IH5mMQNAbO3dsRPBZZKprrZKG8gWiaT6H027FsLcjDm/NMQYqk1ZtvdWqQy6Uf2hPguHqWdFrxhl0EoZUCxvTg=
X-Received: by 2002:a05:6402:20d6:10b0:640:9db5:ba2f with SMTP id
 4fb4d7f45d1cf-64105b8ef06mr4773837a12.30.1762415480479; Wed, 05 Nov 2025
 23:51:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251022174309.1180931-2-vincent.guittot@linaro.org> <20251106000053.GA1932421@bhelgaas>
In-Reply-To: <20251106000053.GA1932421@bhelgaas>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 6 Nov 2025 08:51:08 +0100
X-Gm-Features: AWmQ_bki5HMad9R_EvGRCt6ZsgIelgkfzutK5gpeBF-eV1fPQRjJw2903OorBCc
Message-ID: <CAKfTPtBWfuHP2h+7ExJ_mm6zt_DviQTa5KEUwECCzxsLk5=pBg@mail.gmail.com>
Subject: Re: [PATCH 1/4 v3] dt-bindings: PCI: s32g: Add NXP PCIe controller
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, 
	bogdan.hamciuc@nxp.com, Frank.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Nov 2025 at 01:00, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Wed, Oct 22, 2025 at 07:43:06PM +0200, Vincent Guittot wrote:
> > Describe the PCIe host controller available on the S32G platforms.
>
> > +            reg = <0x00 0x40400000 0x0 0x00001000>,   /* dbi registers */
> > +                  <0x00 0x40420000 0x0 0x00001000>,   /* dbi2 registers */
> > +                  <0x00 0x40460000 0x0 0x00001000>,   /* atu registers */
> > +                  <0x00 0x40470000 0x0 0x00001000>,   /* dma registers */
> > +                  <0x00 0x40481000 0x0 0x000000f8>,   /* ctrl registers */
> > +                  <0x5f 0xffffe000 0x0 0x00002000>;  /* config space */
>
> Fix comment alignment.

okay
