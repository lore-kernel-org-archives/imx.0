Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099453E0C7B
	for <imx@lists.linux.dev>; Mon,  7 Sep 2026 02:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788747610; cv=pass; b=KNPIv4T5wny6BA9WZIa/JBFYiY/a8W5konuBmwIgr8BCBawlamxEj8yXNqj/vV269PXJwELWrhf5SGQZzrm3zVGuOuMU07WRM2Ic4AhKu1zJrEyaK4O/ey4LumTAY8/zfnWR6TLziF3LfIbf/zGpseE87MtlDqlq5rwKFz3DFkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788747610; c=relaxed/simple;
	bh=yjZIwk2F/FS+WxKDAZj/VzO4DcfE/wopEMvNXvjZ3KI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=al1pzRWysZBNeUM0DdBFiyIqg1H1Rw2U3N5CE6si/iZN6smQWnHw4tgS+5Mw/t923zjvKKxT3qqhmzR2nQLav4nFaFebGuoeMaxIxEHePX8HJ31B+0yaalyusD8cnDLeTbE9uUUVonONXvI7KnkUtyEfJkNbXXzXgrc9RjAuhYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3xJWibZ; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3xJWibZ"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so2949330a12.2
        for <imx@lists.linux.dev>; Sun, 06 Sep 2026 19:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788747608; cv=none;
        d=google.com; s=arc-20260327;
        b=GePTjjINmFfa/jVghgwE+OSqNUiya/H0yyx7uZK2AIIQGIY907uYL3wBxT5utgDRSD
         bZ2qLrirt6pL0lDrbDM3sglxvMzP/oJUJtvVF4qhIZD/EnMbVTDCvW8Q/S6FClDJQMvW
         Uu/VG9T+C2CG28CQoPG8YipFgOeesicCd1r9rZH6LwXn83WBkERufqpRzadiMbuKJqrI
         rbrpqEiI1ZVAXtVwAVCNeEzIaclisqN3z5cgnCbknu2z8FJxN+rZLPeDDoNaQvH3NObl
         OefZBIvLZQtBQ77zfzYZmE8KhsO+3Nfso/VYIOUrcfK9d9DS+tA7hBfcf8ktyQGSIVde
         Y7UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yjZIwk2F/FS+WxKDAZj/VzO4DcfE/wopEMvNXvjZ3KI=;
        fh=Q0x/y9N7UP4EjdOIoVwvr68jQdgHmFb84USgnuP7l/U=;
        b=AfEfqJUcg+lSmEHZSRg6vviXZ7Z3QB0HK81SrFiSfWgV9hP+NHwavqGh2wGhky1jVz
         m0sDmdvRG92PvcW+Tm/EeKSVuqoXLZds8K7AaEOxT2/auten2F5SvWQdItCJen9TfITg
         jawR+RuLnr4EwLVKBELn8gVUVaSSDKrFlL0qL5XKp1L53uE6JbITwrkYlSlW4PV5wZEl
         r1F1/8izGth7x1OoQYZrlgCJfhTE9l2m6s14OlpwqoTyEMGnr3sE01X+8e44Mcmzq32n
         KvKhcToOLFZ2939aiTJny7iv52/lbOSa53T14mnpmsR5cys4gEBDEqFhJlM1C3gkIEmD
         kHjg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788747608; x=1789352408; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yjZIwk2F/FS+WxKDAZj/VzO4DcfE/wopEMvNXvjZ3KI=;
        b=h3xJWibZdDTQqopWJ8sFMH7IIeZ3Bw9EBWYjL5mWJbyscQkclRWE+LC5XDwElUDyep
         Rz+yxBJU4j5Tl2+rkqUkBdXh5xBSZWP0s2zKlP4qq/lMECylVmm8bsWB70xFbM75tcGT
         bFRdoh+1zaYv7xjlK4lUN2Gm9G1NqXf3TVW7afwYhDkMkn1Bm1vdv83KX1K9o2EIj7fq
         Ognux/Lj1o4DYYuK3zSrrOCJCamVZ76a/XivFg1CCgWnv1Z/m40sISpfXxWYQMwLdVUM
         d4CeEOBw7ZRzVGhqvvXrYLMr49+l0nlcc0EEX2YRc3FGHdnEe3cCcaF7SrgnlQgN7fKA
         xhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788747608; x=1789352408;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yjZIwk2F/FS+WxKDAZj/VzO4DcfE/wopEMvNXvjZ3KI=;
        b=gT/HwosMuY7pqmLAunjDZZ5Qqln6nuZUq95TleeCQtELfd/gxNT17wHxcJrta1GAFc
         k7vIlPSx8FfgvkKx8DumZR6xS+YtWxSD6eoVH8ujlg2EfxGdb97hw8GYwd7CGlcXMHjz
         9Zojs22ZB2MaNa17e3T7EC936QaBKFIQQJx5b+qSTyFFaA67Gebkx5XZhGMLuB/vSjTQ
         k5MmAD93srYb9Wy6P7Q73Cuku3Tl9Khn4cSF41fuBPIxT4+dm0/gPXvUoV9CBOolq2oZ
         9HQClmzgF4Ku+z+xGoxRtdxh1/QDKGBBIEAGjmZNJ/G1+bTXXAAPR1M5jUNBBRsfxW4G
         GUmA==
X-Forwarded-Encrypted: i=1; AKwUvBz14xvKSCBxQ3O6HfoIkup2ANP+XCoLx74s4qxICYuRGaW6QevYgxGhAu2wqTjmToII5Gs=@lists.linux.dev
X-Gm-Message-State: AFuF++m/Vm6ouSDm4p8VgbLJHhymGlMw/P3jN+DRFU/KgWyzGcNtgmgn
	gpkaw5nuvyYgYIX2iZHpwT1zgoHxjtWqBXKOjYE88FPSMuAJabAtoIAH/LlEgz6K5GjfQkg3gM/
	YI+BxeVFRICoh2HfWQMJzftxWZx4lId4=
X-Gm-Gg: AYBFou3TJQVIit7clLsblGzZdTRPJMSSNQVjeTQsclyZbpBGRa2gqJ5QEBR0wUmtr7I
	xdSZ5JjceHsO2k49HQA/GpuHziJURLy0f7CQ+JKxK5qZkRIE3hrR4Ya/a26fBEDh8Av5VQ6rdgH
	JTAjeyZdVpkEIbdAPQEeqy+hLNAi9C8udNwMOvoYqIiFjFPcimb7eMdEOzWmbTVh44Z9/vQKArZ
	Z7+ZOjzDQkf1kJDYE8KRLDnCPFf28nrSQFQq7sHFlB1MyZPJDi1CFckIiumZGIIECqgIqdmSnML
	lPp22Zctb0IaYWGRsSNjGuv2lTe5/sAdAJOPfTSCi5TbWSdcXh3A+hLzl0onJCfFo7dSP7w9Zbq
	DPkv9fH8vrFTumio2FztU2+1ewWwqTB4Ck6dUAunJ5GGBoHExsazf4Aql
X-Received: by 2002:a05:6a20:914f:b0:3b4:7e2d:a3c2 with SMTP id
 adf61e73a8af0-3da3a03e965mr30021035637.18.1788747608151; Sun, 06 Sep 2026
 19:20:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260903092430.354186-1-phucduc.bui@gmail.com>
 <GV2PR04MB117394049F412AAAC59FE93FE88B62@GV2PR04MB11739.eurprd04.prod.outlook.com>
 <CAABR9nFD1+GJiWdyxiuGVRzKjpCUfu3TQHYOLnOym3hHzOM2tg@mail.gmail.com>
 <GV2PR04MB1173931CA07AEAB48339FF71588B52@GV2PR04MB11739.eurprd04.prod.outlook.com>
 <CAABR9nFi06-7=uHmOBFGZv1eUYCskv8WspOdUxbDuQ6vMk68Dg@mail.gmail.com> <d12608a5-468a-44ca-9442-07f2eee4e335@lunn.ch>
In-Reply-To: <d12608a5-468a-44ca-9442-07f2eee4e335@lunn.ch>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 7 Sep 2026 09:19:56 +0700
X-Gm-Features: AcwNN1UlYoV4Zt-Ge1izy88cCImOs4q6AUtidKnj8n02ugjYmxdqp8X_pG3V4ag
Message-ID: <CAABR9nHuSC3jkfuvN0hUU2spfeDfSRDmkVqsvWdwHyyQOsZe1A@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: fec: Propagate PTP initialization errors
To: Andrew Lunn <andrew@lunn.ch>
Cc: Wei Fang <wei.fang@nxp.com>, Frank Li <frank.li@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"davem@davemloft.net" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
	Stephen Boyd <swboyd@chromium.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

Thank you for your feedback.

> > Second, the current implementation can silently ignore -EPROBE_DEFER and
> > continue probing instead of deferring.
>
> This is a stronger reason. You should mention it in the commit message
> as part of your justification for net, rather than net-next.
>

I will add this point to the commit message.

Best regards,
Phuc
