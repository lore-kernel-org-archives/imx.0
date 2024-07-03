Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E1C1849C7
	for <imx@lists.linux.dev>; Wed,  3 Jul 2024 17:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720027589; cv=none; b=MQ0qJ7gmgw0zNfyvDqzVI6B9sQF/bX4CKs22pazZ2YBxful8uaGICo/MsnaOwr/gzVB71cIpwbqwuLvIIQee1Vo2ljK1WWZ9luyU0go/A1DX/ZGFZa+xxQf7StYCX3jCbRrsyjB4+5ET6uIBDxSdGuiuw1aQetRXz85PwXDiPEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720027589; c=relaxed/simple;
	bh=lG5QlmOYzaCiZ3VzgHUMnRXWLjeAxrYdEL+D1zQh7fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bS8u+YkI+tDRggEar1Bz5IKHajw3z96EuLaXZDDEIk5UUrIAg9mgmpI1fh4a4s3jnN4HFTUUEkKVclRNaIfl0mYliXDtlLoDKAfMgrOQj1iNuwpXIeQoOklt2QZtEgBfAnPVjrWSgs7GogfPtxZxmf4i8+MjPmtthLv1CH0Oy8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sP3CTbrf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sP3CTbrf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B885C4AF0C
	for <imx@lists.linux.dev>; Wed,  3 Jul 2024 17:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720027589;
	bh=lG5QlmOYzaCiZ3VzgHUMnRXWLjeAxrYdEL+D1zQh7fs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sP3CTbrfWHZH+78Ia9vI8K1sS6Z/38xAHsSBKvQ3WPdm385XgOkySkDfZpprayszs
	 DLY4JwWPVTlCcZurIpzeCRGAMa/vtXlifnkTZ1quQI8gia7m4DbjGtwlxSMGsu/DlN
	 eu5vO5fZMnVr/wt33Z2l+B4NbWMpVtDClta34Q7fhC1DzpgYuNuRSAzdAR+7EiMkcg
	 pFqpC/zcQ5jkrkjgzso/KySuoetO+bt8CdtOaOVI0jjgzdW6G4WBAK5uoYMuKy9vkn
	 lFOVv81hpMpoMOS9P6I7nWuZ3YH8kKd1S+k9hBOVGT0g8/nJL//YFM29liZtfBMp/X
	 xpahJAhNhnjDA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52e99060b41so923848e87.2
        for <imx@lists.linux.dev>; Wed, 03 Jul 2024 10:26:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVlvJ7Kea9w2RfCsSSpZoYa2AsmiUAsRhxCfSqMcAqOyqQ0aoIns4nu5PWE6W1fQSLmwHwkRuM+8B7mASr4ztIor3je
X-Gm-Message-State: AOJu0YycbYtl98E661bvR5RIMX6Pxj3Bo6u5VM7H0N33/Kgp8Kr7GvtE
	orNfku1fKyjbPUyUrcVUrGyTAcU2RYlHS7pAKow74eVtzTZJfUPcExG0e03fkTN2WIC94uf1Fbt
	gtw+UcGEsE4HuhUwfoysX3nazwA==
X-Google-Smtp-Source: AGHT+IGgsfT5BY8AL2ujsw0fXIRG3p1+MPA78RYjJwdUQsIYF3NygJ5dA7fiIYEZmWR4BrxaYTEn1g/FIBjrUo5y8yY=
X-Received: by 2002:a05:6512:12c4:b0:52e:9acf:b698 with SMTP id
 2adb3069b0e04-52e9acfb908mr1150424e87.36.1720027587540; Wed, 03 Jul 2024
 10:26:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240702153702.3827386-1-Frank.Li@nxp.com>
In-Reply-To: <20240702153702.3827386-1-Frank.Li@nxp.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 3 Jul 2024 11:26:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJAKXfdSVGrOvZFn7_asmgv_g6a7-A7wq87xXKpJJnC8Q@mail.gmail.com>
Message-ID: <CAL_JsqJAKXfdSVGrOvZFn7_asmgv_g6a7-A7wq87xXKpJJnC8Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: PCI: host-generic-pci: Increase maxItems
 to 8 of ranges
To: Frank Li <Frank.Li@nxp.com>
Cc: Will Deacon <will@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:PCI DRIVER FOR GENERIC OF HOSTS" <linux-pci@vger.kernel.org>, 
	"moderated list:PCI DRIVER FOR GENERIC OF HOSTS" <linux-arm-kernel@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 9:37=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:
>
> IEEE Std 1275-1994 is Inactive-Withdrawn Standard according to
> https://standards.ieee.org/ieee/1275/1932/.

That has nothing to do with this.

> "require at least one non-prefetchable memory and One or both of
> prefetchable Memory and IO Space may also be provided". But it does not
> limit maximum ranges number is 3.

3 was just my poor assumption that a non-prefetch, prefetchable and IO
region would be enough. Not sure why you'd want multiple fragmented
regions though. I guess for device assignment based on the comments.

> Inscrease maximum to 8 because freescale ls1028 and iMX95 use more than
> 3 ranges.

Unless there is some actual limit, I would just drop the minItems and
maxItems here. Then it will be limited to 32 entries in
pci-bus-common.yaml (in dtschema) which is also a 'should be enough'
value.

Rob
