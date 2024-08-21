Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC1A170A36
	for <imx@lists.linux.dev>; Wed, 21 Aug 2024 21:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724275121; cv=none; b=ViN5MzyTM31HZJKXNaN2L3K96SIIPv9+JEKCZGy2sSnseJvnbY7kKJF2JN2yymT5LULDB1GLjbtPrY4pDGhLulQXGBh8/KsTyZ/uCWs5Ri7BuboToOXk37CBalZI13lD5OS6h2dcM6pXchG7ewAY2DxxH5UDrFsTuDIyaMJUvKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724275121; c=relaxed/simple;
	bh=9Ieq89fKSBVTEvc+D8hBKOSACthGVLaFkrxnq1bQ9W8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exeWN7qoH4lQzSxXgJqws1/Rrn/A3FKk2fQcrwh+WwDStuQH2YmBP2j/G1tCCjhU2tnxlKd66GCes3HGhmoclqaFeE8Wg+tgIQFU8uxuH22FDewDnc6xq8G3X4Hj8G++RS0sG+hwPf28FGFapOnqunWn9pIuuy2Ms0TJICs+mSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGgM+bsv; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGgM+bsv"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f3ce5bc6adso1173541fa.1
        for <imx@lists.linux.dev>; Wed, 21 Aug 2024 14:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724275118; x=1724879918; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ieq89fKSBVTEvc+D8hBKOSACthGVLaFkrxnq1bQ9W8=;
        b=FGgM+bsvdWPpfM3jKV62ojXMcvaEYtqC066hGXbcFD5K07q2TNaLx37stPtKxZCTws
         ZgF+UHmpvIHe9r8GrttXfwO3Q0TR88xdDBbUwXAz3Vkmewuw/hpJsd31QfQE8Clm7/sD
         DQ2ozvKFNQpQQF5KuW/SFUpk5fLgiNno87jLbcez7ZeWshd9jxzIvXXKlUicJpM27tUl
         CKILXaZOo+/7UP3oX+fAnGyfzmQ2vG77Xe0oHHlvrtAh6eLLPO3dnPFjfA0mSrodMh6c
         nODHnBZuAyOQN59HFfYvFZqL3AoiH8dlopGK3Gntv9sI4z1e6Gpwxnzi1f6mLLVCZkfm
         95Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724275118; x=1724879918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Ieq89fKSBVTEvc+D8hBKOSACthGVLaFkrxnq1bQ9W8=;
        b=CVyhHzda7fJQTwr6FYfPynUOt4yQkN4GzwMH6RTOTGxCv8J+Hm9f0oOMod+M4bXYCd
         I/tzRiBnz2gLyHAK33RAxw41UcqXfdaHxwlc/4eHK4Uut4nMAvXk/5CiWUExvyQiZxFF
         piGwQlZUPh8VqUR2Ck2YXW7Ch0TLDmtdutVe5ZrW58nFunWoQ9ElYC/uesAqG6+EO+1R
         Pt8WDCJUF9A9+a13Nni0pA/dhYynkfYTSwQEuSfAbcUAF5d77rE2GO7lB2L6bHY7Sdfe
         F+C02wnFsjIVo2w8poVpmu45vLmNj0ThMUmsR6wHgWqt5pkZ3BrG5G1IYDxiGKm4wTpB
         fFtQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5lt+Dy55oZrjYHdHqm558ATA2DPLfWAe4p9sYf+7G2YMLJ0hfIB59AhVdBxv8Djhpe+M=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCUKBgkpz5Ue/ejj/wvMNk/f1XGI4h4u7lP31UCD0WF8acR7xe
	KTxn98nthbag4IPjIzH++a+PrAHG7SbHUzbmNkdm3wX0JIW9EIcpX/wWr/PB8pLoi4lCvewm5fB
	jZhEU94p33XFwZZnDCbP2M+ORAHE=
X-Google-Smtp-Source: AGHT+IF4A7L+53ZaTf2fExGKqcZZk+WWzGG1SGAa79vRdOnrxfpve6MYoUmDpikZKNIKs12zBAuH1wiPI4qxB86GMfw=
X-Received: by 2002:a05:651c:1502:b0:2ef:22ef:a24e with SMTP id
 38308e7fff4ca-2f3f881e268mr26168671fa.10.1724275117923; Wed, 21 Aug 2024
 14:18:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240821-dwc-mp-v2-0-2a29b6a5c2f4@nxp.com> <20240821-dwc-mp-v2-2-2a29b6a5c2f4@nxp.com>
In-Reply-To: <20240821-dwc-mp-v2-2-2a29b6a5c2f4@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 21 Aug 2024 18:18:26 -0300
Message-ID: <CAOMZO5BcTyuSxqyBEESyjVy07RhA8YtkHqByfCgEfMgYqVbVjA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] usb: dwc3: imx8mp: add 2 software managed quirk
 properties for host mode
To: Frank Li <Frank.Li@nxp.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 1:19=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Add 2 software manage quirk properites (xhci-missing-cas-quirk and

Typo in 'properties'. Please improve the commit log.

Why are you adding these quirks?
