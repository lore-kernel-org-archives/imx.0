Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4B613A3E8
	for <imx@lists.linux.dev>; Wed, 21 Aug 2024 21:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724274993; cv=none; b=EWVLNp/Z66ptqNX/shYbfoxqGBhwzQN7VudUAcNXZW5wZHJcOUJ3VuvJU5DnrPBOBabOxpaVqDzFV/Wf2K3v7YGIxQziO4xGuETWq40lnIv4CgayQF/XXogSfIwcH5b9vZzEjlt7x0f7iKM8XWOuSKeYGdHyIpa7YMe7ZGHzrdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724274993; c=relaxed/simple;
	bh=TiUGC2plqsju+PIKUdlgp4dVJIOBq73ZHtfCj5+GMVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gLEcLYX0ZmD9YE3L4D71wbixGqMJUMAX6gdKt10Zl/OyNMu+l50hXfOnLz0e8AM1RcBH4o0NaOa6AWk7GG34pTK1fJxjx4Xvgxsp4ugGAveRWqCiw3kmbvlKBnhkMlpmuYApk18OBHtCzhQ25P3E7aXwz9buw8hNR82GIxQhJKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cB/EAf2X; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cB/EAf2X"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f15dd0b489so1590821fa.3
        for <imx@lists.linux.dev>; Wed, 21 Aug 2024 14:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724274990; x=1724879790; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TiUGC2plqsju+PIKUdlgp4dVJIOBq73ZHtfCj5+GMVM=;
        b=cB/EAf2XpSNSvcmLK66/uPkXWff9sfn+Kp+7o93DTg50kjeA9mSZB18fizYc9l26bs
         mXjmdv27vCVMYq3WOcXM2xLFFL7idnIg/S03H4pLPqSFaIfTIjjT8aWvMwY7+L0tICeB
         IbBnKCWtRaXNwZtrJ43v2Qsw6sYFxXu3eL/RpKCCVQ416C1cMNcNLmWkpyZXQ38zP0UJ
         y10k7I3147s42/xW5D55fhaBk03zchisS6KBpxRs3ka++oKWnWifcUxTw2ZZ82Nr/0mm
         azSPvTzj9YiAJgXAKrFOUNBLKoXjNIczws2yoZDEc2UdPwV/UkglhjATVa9qCNm/jKW5
         wXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724274990; x=1724879790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TiUGC2plqsju+PIKUdlgp4dVJIOBq73ZHtfCj5+GMVM=;
        b=UpTrgNQ3l8H16RmCniAN0DgCv6vRkLtZikyyIbLA+sCKxp0vr3HQIljzX/7ciRzzGF
         YsSt3pYS/+SerQ2zuPcGa08HOAt9XNXvpxuH0UQSkmo9jYk5wVULlPFrBedJO3UzJcs4
         78Qgt7qcCfQbUoOY1fc1hFjQGl0ZFpatxIAWYg05hmHNLUmthib1A3RBnNkg2es3i7lQ
         sFqFzClBNdee6Ndem3y9I5XeeKGnkNqZ6Qe78Pq+iwnoi3gFvwA9gDbwA/NM0oxquk5b
         V/wBgKYRcJGSuuoMB+LISYunjDDpRG0xjIUh+5d/HZRCIedOaThNVNziwQYCd0NRAqMG
         hKYA==
X-Forwarded-Encrypted: i=1; AJvYcCXCEHOyBf4TS/9gvDI9gU6yhxmUMjFvfWUGFdwJda8PUj3GFHPx4e05d9Xpr9ZOALwsWwc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFKm22i9qnjsS1/c31TdYMuABgF+yJftVfXMNnYZo/LVbfc3OO
	cb27KnAOZD+vGDJCN9dv24LsfbxKvuITqFnpPFHDDwowAk47/aFAz4xfEs1rFxAQM5VdYXDMt0W
	9jF3m6I3QSiFpfWl62a6GrpoTepA=
X-Google-Smtp-Source: AGHT+IEbvnYernfbaPui1I8nfs8or7e/vZuuYr7xXOntlaLltoQcnHV5tFfpUmsarL5GBVzxBFqU5Ef5XzVrlzWd/Aw=
X-Received: by 2002:a2e:f12:0:b0:2f3:cd4e:b929 with SMTP id
 38308e7fff4ca-2f3f8953813mr21761351fa.34.1724274989525; Wed, 21 Aug 2024
 14:16:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240821-dwc-mp-v2-0-2a29b6a5c2f4@nxp.com> <20240821-dwc-mp-v2-1-2a29b6a5c2f4@nxp.com>
In-Reply-To: <20240821-dwc-mp-v2-1-2a29b6a5c2f4@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 21 Aug 2024 18:16:18 -0300
Message-ID: <CAOMZO5DNndao-kU9s9F_1XGMdTP-sgComD9UoaSOQpfkErBEXw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] usb: host: xhci-plat: Parse xhci-missing_cas_quirk
 and apply quirk
To: Frank Li <Frank.Li@nxp.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

On Wed, Aug 21, 2024 at 1:19=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Parse software managed property 'xhci-skip-phy-init-quirk' and
> 'xhci-skip-phy-init-quirk' to apply related quirk. It allows usb glue lay=
er
> driver apply these quirk.

Please explain the reason in the commit log.

What does it fix? Why do we need these quirks? Or what does it improve?
