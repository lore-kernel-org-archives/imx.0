Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891861E511
	for <imx@lists.linux.dev>; Thu,  3 Oct 2024 12:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727959540; cv=none; b=pz1UGuImPVkVYqqWd5MZ1m66rN8h231lH3f0mlKraxGgw5iOwYPDmCWXl3++Nlk8IVbq6APEWLM9OaA9/+oLSDJwSTSvqbUuG4XdrpudefMFoDPjT09d1c53sfFxY9nUrozOPhrGSn/qrCk1PBmzf50Cd8AwoFpLJUB6Z0KEFC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727959540; c=relaxed/simple;
	bh=h8glWa8FKBKj3nCk6I+JgRJLRZCrCXwBgF2+dYsvdM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K9onHK//dRYcPrrrmyvEFoeJ7yZaLsm3QcEQf8DRqdO/EUYynRxI6ETBva+UxLMiyPUmJkZhCc97nFQuMCMwRFpHJQwAJ/C7VU/uP7zGcYlCBasZEeSacs7VUDqJCokEqfXYGOc8pKtaRD0mAbiLYFhstdUknUdLAPXnHCJU3A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYtNzpLH; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYtNzpLH"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5398cc2fcb7so1044764e87.1
        for <imx@lists.linux.dev>; Thu, 03 Oct 2024 05:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727959537; x=1728564337; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8glWa8FKBKj3nCk6I+JgRJLRZCrCXwBgF2+dYsvdM8=;
        b=cYtNzpLHEEsCsKgozfrBrsOP3UoyIGOtXsvDx7PmcrN5eSAkfkmGiPIcL5HRa1xnnk
         IdtK+U0AxpOB8+S0QmnClqFU67XFrQEwpZAoC4vsApTf5/8VPC1h4v+UFs8SN5P2srpm
         IUJb+8f69cSNzaKDmvRzAODuq5EHtam4+BZgNVDxGWTlp1nZThPkKnTqKCoZ/vecwUpr
         jHeS7cg1/t+MyOJbxokX/GA7HYBQCq3YMMTnm7ykhS8XwDtj5rOkVq9TGhplIx1s174Z
         Sb/yAcomjTVO+IBLHVNuVIGuHbS7+biQeHlZ3nkfQz1VF1dn5UqlHRLCVO1rzrD5Golj
         nnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727959537; x=1728564337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8glWa8FKBKj3nCk6I+JgRJLRZCrCXwBgF2+dYsvdM8=;
        b=J1Xm503Mt88LEyt8VXb/w60fYzJhfscKudC2BD/0gybOBz97H4FdA8QzNu7MrCJ8gU
         zrs6bntSw+zWwGFBxyQ1O7du9yg0F1jxytgyBO5Os8z1fsyB9iPAlP0lC3b0fs+Dql0A
         Xf7J8/8AQw4NPr9PLHHnv5PZfeqYxxoulur383AI4+cq9/u/aaTHRyPH+smxT/llM0j5
         boYKE1qtX8cAY705JhR7Hkw2Iwg6L3KJsaPZvkWDeO+p/TQGRbr40h28iX5h1dDfbuB8
         dnK0uqyOwGll3qTP91LeC9jTG1FZf5MdPKzLuJCMQp3s1MRvN9lA87/YfH6SXYVunzUW
         /Dgg==
X-Forwarded-Encrypted: i=1; AJvYcCW149M7kGTTD3D83GReI54mQzCnIGCyRYXoBRVSVUEkf9+EEsS9kKWcthGAuXB6jBQGDUQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwX2Qkq9Y947aIRWDx4+xqhl84VTQIPX6u43/seSgMQSCjeIwuR
	LYIrfQuRYwnkq26RvGr3HXW6j95MOR3rBRC0G9S66mQCDxPe0QqBo9rosdHSez1jW3uBOfq0buT
	yWm+QTYv8TYJ3yytQjU8yR085HhE=
X-Google-Smtp-Source: AGHT+IFH/d91ETaLO9wS69JBdZtdkMi1nBG0J5JtGXgyo3Q1FiOyG+AaAEmd/z9+6SFqLvAFdUJ6gCbWcbyQrmqWuPc=
X-Received: by 2002:a05:6512:12d3:b0:530:aea3:4659 with SMTP id
 2adb3069b0e04-539a0658b50mr4221107e87.9.1727959536381; Thu, 03 Oct 2024
 05:45:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241002204750.597337-1-Frank.Li@nxp.com> <20241002204750.597337-2-Frank.Li@nxp.com>
In-Reply-To: <20241002204750.597337-2-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 3 Oct 2024 09:45:24 -0300
Message-ID: <CAOMZO5CDwN32kiPWQ+ObNiFD1Wewj+qyTUMCRhyXKq941phAkg@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: imx8dxl-evk: Add PCIe support
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 5:48=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> From: Richard Zhu <hongxing.zhu@nxp.com>
>
> Add PCIe supports on i.MX8DXL EVK board.

s/supports/support

> +&hsio_phy{

missing space.

> +&pcieb{

Ditto.
