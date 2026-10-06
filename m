Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB4B44F55D
	for <imx@lists.linux.dev>; Tue,  6 Oct 2026 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791299920; cv=pass; b=aA0y06n8Ghe/VvCYpbQARBDiB/V0L0w5NCnOwSaDyuEFIduIvcfiwtl3VP68mWUPs5zQxaz8LJplCtjgpl577Gqwgu+Ksz7iorqAqsL9qdZSrFb6DKJql4sWd7sGomD/jHBa+S7V8ddzLMbKLzAIbRDuwGacEA5gRMvSbrtuZn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791299920; c=relaxed/simple;
	bh=Z6WbsAnp0/k5TRam8CoApQG5u2b0ang3JjfGRsR4/LE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A5/b2SsPOAZlK7jRkT8IZsd2Myco4I9tvWGwza6JCRNX1GKeLN7U01oCTdMScH+jvm0nfY8y6PCJ4eyGKi6ZgPCeUsG9qD0ELMgr46N74BVuQrj69g+A9xOPC/2lVGmdc2WhgiTqNNFfb7WhFW+HbgLedjdZfwGmkscmLtwJGxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V1v9m2+y; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V1v9m2+y"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so5132864a12.0
        for <imx@lists.linux.dev>; Tue, 06 Oct 2026 08:18:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791299916; cv=none;
        d=google.com; s=arc-20260327;
        b=GzWKDXK06yVopZsM8Er/lUpiC/7Td2d3bbJn/q9NIohiwEuzdF1UGT+C8ghXp0KQVK
         4Jr8yXO19kq+0M2YszHKuFQOsxlHGkW7w1NxDnA7zOwDBrNea+hVBdrSjTfzQIbAKCZ+
         +SLFEYQ7oqTohKGQ1qqpxe15LADzFuqKOStVM0qPly9XcRvdlO3CEeS89gWL2MFV0wpJ
         gI0jVw3D00g3rw5a1cxpYIbAm5YaK31SVtBdPTvwTnh+j6E6RrsGza9qzmnxoB4GMWDW
         72PRjj6uiey/zR6vXFOWv6nPDewF0T+fHslFFjVGLV4PtwBYoZTresfOf7bOkm3N8a8d
         6YoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S8HNQKq2PFFrdWWXN5HW5t8uFb87m5DPyp4zd5PK5G0=;
        fh=lLJo9H7iqOqO+qOWrG3gmWMzQogiR0WEM7mPJNKB9ks=;
        b=bnnx2B7RHvcJDIYPyYcJSKiKHk1TA7B6G+uqJMCtONx84FeLSHIVv9M6Uq+SBoX3FQ
         CsldBTqL79AES2jSFrfmoVy9bSz8uGcc48rnPPb7nrIwcPMMMwkIRBSHzfaWwY87xvq4
         XT6CKcsqqcsFLTto2Sv9Fi5As/lYn/FewSNLBopbUKuEjITpjr9YEpNvsIT4fSSBKZM5
         gQuXIIAsch3I7uegCYAiN6CuYy6ZgFadXVwFDYAlzk2ScP1u6Gu3XylUuASKkubJ8iRs
         c1ubT2ov1jTZJ9YYZGEsqZ7xpBWGU2X6Jc+nhjpCuTzk5F/0mBpj/huzE7uPxJs5bhA6
         gvUw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791299916; x=1791904716; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S8HNQKq2PFFrdWWXN5HW5t8uFb87m5DPyp4zd5PK5G0=;
        b=V1v9m2+y5rS/ZTIkGXOdmfC/rA04MA08aR0Cm/dulYhi79Wtw7IFpneWgouRL60E1d
         cryuCJw/jepG3+9/C2Q/eKILsftneGSpxN7rbUBcDzBC5XJjsVbfCmn3nMb3A/5/8fd2
         rB81yVq9vOeMw/4npd4Z0TCbtbqeN6PPxUgyeWXc2rLDt02KM4pH2hbmwqO61tmoi/aj
         fl+TxMuQXtOBGtHL9EP4N9/vw6DjolHh6T9cDtWx9DJUg0p7s/Q9p78FAmLQINMgrr4T
         jUqT/l3Eypi/doImFyDdUl51NuCA22jw8EPzyePAhAB3OwbUDTWZekpG3JW/S1CSDhcC
         Rxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791299916; x=1791904716;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S8HNQKq2PFFrdWWXN5HW5t8uFb87m5DPyp4zd5PK5G0=;
        b=KUL0nQKEPX/Fuer7StnyljwHQro8kFyZ7AJFh+tR0oSFw99q7ZLt3ZPLfFJhbChXNq
         zljC/wfndjhBpJlu4wPt4LkAqix4sPorxYg73RU8M++zEalAU7nHYSvxgdPWwrLAQA4o
         /hVjRsNSknWgYKXtwXjQpLmZ2O9cslXJckvlcHLukUVydRXppYxo6H2/KFh/hpiJOHh7
         kOtjq6EiLSV59WETSS4y83NRVQ32ccM8QDJ7J/tljpkubIET0ElOoIXErCvHVvIcxJr1
         D4j5WL0848rWyPxsOJoMH+99jAt8I/bzRlSBHDTs0PzZZ48Ffk6V20ix4AQ16uTNuz/D
         c/xg==
X-Forwarded-Encrypted: i=1; AKwUvBxiF9rNVVo576KG+V9020rZywjVhuRGAke8NuJgjwR2h2JcYPODORNI8Iw4cdLmo62tbI0=@lists.linux.dev
X-Gm-Message-State: AFq9FYL9lvY/J0Rlq5F8I+DNwHvTyLAr9x3qF3D9LneOkYxrKPOT6Uzh
	KdVcEuzwva98l2QcQTQCoLVogxqH/IBc/z/FbAeRLIJ7izLMeVLIMgnpkT3OMoxbKr46eJa+/lB
	2Bnq4C0Yz6Fe3Jt0FOv3JYCkpMgITFcjW3JsIm+mFOg==
X-Gm-Gg: AYBFou06tHgBtVExOzxRdlH3KElEogfm3FvIaTmVw3ahKXewySo2/05AYQFBT2kvmcL
	uxbCgaRDy5jqH+dTXgukwNpPD/wLLD3B05lgjhH385OydbVZUy7j1bJ6ruamyI5PuvgoUNS0R+m
	0iek1LCCtP6dXFVFt4yE0XbRa5prEX/Epcsp9HB/hzB49yUkGnJHdzBXRnQFGqawGouYLHu2R0i
	CHHsWsrFNbzU8YRvSDWzntmue+/m4ZcSdbCj94+vREOZcof38WiMEQJkIXBUQvEkiNjqzklTy0L
	rb2XSJQnA5ExJ2TXdLx4mEtwWGqWxyvW55mrvHEhMZjlu8i9v2Y0FA==
X-Received: by 2002:a05:6402:52d2:b0:6a9:a5d6:622d with SMTP id
 4fb4d7f45d1cf-6afad731ef8mr8879468a12.3.1791299916262; Tue, 06 Oct 2026
 08:18:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
 <20260923184255.299034-3-shenwei.wang@oss.nxp.com> <20261006030739.GA3457522-robh@kernel.org>
In-Reply-To: <20261006030739.GA3457522-robh@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 6 Oct 2026 09:18:23 -0600
X-Gm-Features: AclHuK9X3bTaGpN7i7UclAS_3sT01qVYKxTd90Hh58vpFwo0cpRNFUaLVMAbBaM
Message-ID: <CANLsYkzcqapDYvKAEa2ZjA=q07iO=RM4TVNUbSqDrB0EmjeKyQ@mail.gmail.com>
Subject: Re: [PATCH v16 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
To: Rob Herring <robh@kernel.org>
Cc: Shenwei Wang <shenwei.wang@oss.nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Oct 2026 at 21:07, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Sep 23, 2026 at 01:42:29PM -0500, Shenwei Wang wrote:
> > From: Shenwei Wang <shenwei.wang@nxp.com>
> >
> > Remote processors may announce multiple GPIO controllers over an RPMSG
> > channel. These GPIO controllers may require corresponding device tree
> > nodes, especially when acting as providers, to supply phandles for their
> > consumers.
> >
> > Define an RPMSG node to work as a container for a group of RPMSG channels
> > under the imx_rproc node. Each subnode within "rpmsg" represents an
> > individual RPMSG channel. The name of each subnode corresponds to the
> > channel name as defined by the remote processor.
>
> Sorry, but DT defines the names of nodes. If it's a gpio-controller,
> then 'gpio'.
>
> I still don't understand where the unit address gets defined. 0 and 1
> look a bit made up. I'm sure you explained it before, but *this patch*
> needs to explain it. When you define a second protocol, the 0 and 1
> addresses are taken already, so you can't have 'clock-controller@0' for
> example.
>

I had a conversation with Krzysztof about this here in Prague.  We
have decided to adopt the bindings proposed by Francesco in this
thread [1].

[1].  https://lore.kernel.org/all/20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it/

> Rob
