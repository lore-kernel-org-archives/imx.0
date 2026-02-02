Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DC4366DC9
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 13:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770038647; cv=pass; b=bsybU+L8zBcZwKd3yuE6p+9B5mUotc2hJejP5A6g783+DebhIWSKOYK9/0W1aQsQjnzlZcet1b8PvB8lD2qCaDwc0NtI/RErX4u6m9axljIAYGTeH9XnkI56FbCeaKCod2zRyLb1jpaMACHyZZvHhr9HtvKjG1bpSM/+w8BB5kI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770038647; c=relaxed/simple;
	bh=1PzvdSmqiv5nImJmLBJnBya6OWd7xbFfZC00CtOaCx8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lm333Lz/FaZBZOUupwLV4X6MelYOQXfdSvWh97lmLg5bGkS0JnGs2stQCkmiEPFsvD4q3HqrfQ9MWpRAMocxWvJnsh2CteiTOEIYQfbtWrCDkqde1+pjdHGAgYkY1oBqLnTd14WLqesAhYMu5hZLFj/ybCpuJr6bcfVJXNqn9O8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H1M04rIY; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H1M04rIY"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6580dbdb41eso6685838a12.0
        for <imx@lists.linux.dev>; Mon, 02 Feb 2026 05:24:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770038645; cv=none;
        d=google.com; s=arc-20240605;
        b=d3STUZce9TQSLjR6qlAet40LoRGEtUDL1gX209NMTo+bS4WKZqLk41XbZxMj7xkoC8
         NstVUuTiqc8d7QXDBsXIpbXVgsvirwqEy+ATsokFUdVe7rtn68jgqVTZDx/Nq49i0BBO
         1OIHU8J7dKauW56okP8UxLGnu+5uTyxTCJwzzOTnl918X9RZwb5H4uJDmbTzXK7ubdXm
         TxFo+M1LZz4AXJOCvsEIAfDbRMKsiqYGPdZQDUwY3kkNHGHu+NRsw3aRIDxp6zL0C64I
         rm3k1F8zHr75fOfQ40uGbCEnSnh//OiQe9LHq1vgQ6a06EnwZz5B1N05E9kzCXEYumBP
         03ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IZtqsNVxYmUM7kVhobNJef7ZiyW1KuqLxzJ4BO5lzl8=;
        fh=ZvKA7BWK8aSEk74OfZEvP+XjaPF4pRq9wSSNBhinUWg=;
        b=RRF8njPNIYJnvq6jc74gAf6gUpLxflFgTAzf/B+7vysy4Jtzq7XWxA8CNTupLoPQmv
         p3qsD87qi/C7TjI+8Hx47xauSjmL2Hla0ydM1GFMiuj2fBnruK55F3i5qOkivf/tpG2j
         z6UbzizPL3PBuGAi+PlygPwKSybbFM8ksNyssF8U88p23/vacUZkREsn64Z0JqGCvpQ5
         lS0JNIwV2X9ZWAg7InVfV1oxRNnI1Fb1W3KRZUhWnlhJJ9/K8uQ5PxxiRE1PMUQTbxc3
         VOBhmctD/CD8wDTXyOtcRDkLQygDGf8MXNV98Xx+RW7QwHfgdNIUkcahaUaZYAzUGIPU
         L7pg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770038645; x=1770643445; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZtqsNVxYmUM7kVhobNJef7ZiyW1KuqLxzJ4BO5lzl8=;
        b=H1M04rIYM3m4BkhCf3wsYbe2ny8z/+hacpKKc0WbIv1imBIceCOhY4MhwQYV2Nn/XV
         gFd59gBqZ750o0Ti8zstyPqo0qSW9IobdggAfwyweKrHcvn62rf7XOP+rBFP5iTafE5v
         dVYBdwCgWuxqiYCIZeHpYy+TSKRH9/ezXa5jAGx22Xq/QK+msjlrPZHJSRPRL/nDOvmC
         rh/MOYX52jEQSlBRjEkLg5pkyxATmcwoxXEfa4/LnMkF6yj9AjyWs0q7BPWPbLVaAy2I
         YwgRJjZOhkjCx+yXaZUFgpelhiCmnRdcQ9H3bGb2wgLabxERXOM47mBImTGdcKBdN4Vz
         OcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770038645; x=1770643445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IZtqsNVxYmUM7kVhobNJef7ZiyW1KuqLxzJ4BO5lzl8=;
        b=e02I1hIZK0F9nFf12iQoQzPxo4NfXayDppcM3ctYGMmpwslOux/iXJKHwntzRt9O/U
         TBvQZOsOu9vOi1WTFLLjD5jSUY5EOqCW8cqwj5BUPwZwkiLWUvARLCKoZOY8Nys3YUe3
         1G75lQ/VBSklQYWXiBuXhhHwBHb5GLsh48nvvY4wgNAqsfFTnyOo4zW3b42xsa7jlMk4
         k0ITS+Df8Dx9V+jLqBqaFxfLYtisaJUyQ7CAIk2O9RhXYxvXEhcl7P7dl6WN68HaLEIl
         1g3HazHj56zS+LG6nXHO51Zy1p06i3Gn8jxklf8xecqV77yJRQ07e49tZ6KRmJtUzPKN
         R6bw==
X-Forwarded-Encrypted: i=1; AJvYcCULTUinTY09LDAP0RG7+pRQMiFbcsLmaI4HYeJIZIEXpQQBW6LqYFAIvVht5qgC87hD8iU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPrm7GMLZ/m9ptxCScsvSKwd+PuNVZg7l1VqJOF7I4WW4jO+fH
	BzljNsv+z4OmJFNj8MJ9TvSOA/4k8cWB9zWFlNb+YACgDlbor7XvJjgkjqS/j4oKObpQ1+2FhtL
	/RsaKOHP2vSqfRM7V5mVpnt1XAQlcSswLbzdOJyO9ow==
X-Gm-Gg: AZuq6aJGoPaVZtlUgMxOaSuRZA1EWIlffZ/svL5uIhwnV7bYckrkL9ooQ1u1sHwfXEP
	3RbN+fIQeiQm5G0XySrWBw6A5YJ0Jwle1iIO63s4nW62lwqirR04eccuyXBVdavZFuezDVW+NrD
	mSgL4D0O8dCl0n9yOfFUU4UZAvR6vsnDf7zI5eLbcHxk76PFZ9mfp/j7nFRQrVXr63dq8gmXAvc
	Dn+cxg42Gg7XeGkcWLD9G6adksHETBC2kDTJNliQMqycff3sl9hMT5Q/VevvMdHsmH7qJdupmPv
	RZzmyUWUG2jGnpNAhq4h3XKQ
X-Received: by 2002:a17:907:2d28:b0:b87:8172:257 with SMTP id
 a640c23a62f3a-b8dff89af6bmr705882066b.64.1770038644604; Mon, 02 Feb 2026
 05:24:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260202130756.1421488-1-vincent.guittot@linaro.org> <scnf5gh3h5pwvnbe4bwtztdlgcpvvtse4fg64bto2jgyotfpwl@sle4k4ky3gtu>
In-Reply-To: <scnf5gh3h5pwvnbe4bwtztdlgcpvvtse4fg64bto2jgyotfpwl@sle4k4ky3gtu>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 2 Feb 2026 14:23:52 +0100
X-Gm-Features: AZwV_QiL5Qef1fZxaIymfSBX4W3u5vzi7FPx445SS4vhFERac0glqVKsoUgJdeE
Message-ID: <CAKfTPtBZCLiq0E-a2QA5X_Bix2PxXiCyuCira1V_wBWZORUS6A@mail.gmail.com>
Subject: Re: [PATCH] PCI: s32g: Fix ports parsing
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: ciprianmarian.costea@oss.nxp.com, s32@nxp.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2 Feb 2026 at 14:18, Manivannan Sadhasivam <mani@kernel.org> wrote:
>
> On Mon, Feb 02, 2026 at 02:07:56PM +0100, Vincent Guittot wrote:
> > No error return is missing after the loop resulting in removing the
> > ports from the list.
> >
> > Fixes: 5cbc7d3e316e ("PCI: s32g: Add NXP S32G PCIe controller driver (R=
C)")
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-nxp-s32g.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/c=
ontroller/dwc/pcie-nxp-s32g.c
> > index 47745749f75c..767f5a622441 100644
> > --- a/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > +++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > @@ -285,6 +285,8 @@ static int s32g_pcie_parse_ports(struct device *dev=
, struct s32g_pcie *s32g_pp)
> >                       goto err_port;
> >       }
> >
> > +     return 0;
> > +
>
> Hmm. So the initial 'ret =3D -ENOENT' will become redundant and you'll re=
turn
> success even if there are no Root Ports in DT.

good point.

>
> You should do:
>
>         if (!of_get_available_child_count(dev->of_node))
>                 return -ENOENT;

or maybe

+       if (!ret)
+               return 0;

>
> at the start and remove the 'ret' initialization.
>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
