Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626B828505E
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 06:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772693393; cv=pass; b=Y72obFma3M1xZFqxsgk0P83R8YAwZFyOZXqLZC4nSfeha7TPmIv80FBP/VJPPhg9/q31sVbAlrG2AI05syupGpUNRSgOQ9eYlRN+FwJiiaqzsUjAbB7fq1ZrdLbptxgt4uiaS5p8GsADDFo1yW95RrPrnMpFCkeqaMrSKB53qc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772693393; c=relaxed/simple;
	bh=q2c4mZ9tdn7OtEMIDnKeERn7b/4c+OrCVLP6qmXta9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lOoKQfG9e9/n2IkAnZuTgeOjdLAMQQLM/3tfk9KtwqpRtcwWo6/nNFRyqqmIaFnaKEfWD4xLXLKJn5yzh87UXW6NtdDzhTsTpIA6ZJOS5aPWFlWwjqtB19KXgZbV5e7np5cqP+OCCYrpxhp2F9FG97qZmyWhyACoY6+gS6Mnt6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPaEIAkN; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPaEIAkN"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12732165d1eso8331571c88.1
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 22:49:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772693391; cv=none;
        d=google.com; s=arc-20240605;
        b=YNUi1w2KSKwhI+GoOOXv8nhacNEfPtD76uENR8UPk3CCl/J+Yqk1tRhfYYto3FrTjA
         HkFfPNqmIZb8NFJUphb9Wni8huKXR/xbu5L0o+FtKAI0rc5gvvLo7sSTqT0gvE0szaCo
         NdJ+2JYy2DKoNeejTJ4QqVM2F9pW8fWztr3qms+PoptxvAHo7hDGUsuivtmVkEftwOCQ
         iseFiqSJDV1RWO9Ud1gZ4pYe58EuL7wXxiqhz7ORoNW54Eu6pI7YVftHPSRSrOsVCiCh
         wm2p1m81Zdu28xB56wZXWHJo39v5UYGBeM/ANLXYILKx6oy+CYXKSvuCH6w1PFBY/2bG
         uVcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SJnKoH2k8aUsMnHN9s6q8EPoGOgHGpVja0sh8tMg5Zs=;
        fh=IZQ/itOm8NlUFxg4slCPShQX3G5pZPIO8sZ319YFC88=;
        b=MovgSotsgNcWVmWE0P8VQ/B8qu9hlPLm6nt1zzt3bvVs9PZzLuT44GMXGfhmrQHgeq
         5W8taL/UrtpM+6TWAs4bml4Hf8tKKctNoz9vhygDbNYsC007N9SVXASswYe9ecrUjUZq
         n6uHAS8jEN02GoWUzvoNA7+hCVC2Tr9DCP27ls+d7yW2Coeh2c0eJrBQ+kXue7bIC2ar
         VmEpvbnJERAoV2wfSp9gN4Op8gWW8wFwZHFJMUU35ScA3v+YAAf9iReYll7m2Z7t7eVo
         Yyoaosi74wUFAPAaAr9tZG1J/s7lh99CRSTBr5L6ryTDFE95m6R5lWxd4Hih67ma+f+V
         jnJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772693391; x=1773298191; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJnKoH2k8aUsMnHN9s6q8EPoGOgHGpVja0sh8tMg5Zs=;
        b=JPaEIAkNdjMOFnQsmGHA9usnVUyyE+IEYGJt0mdwnt84Pw0i/mFQRf7Ya44w3szVEG
         QShvVMXvFZXKGYPEAWNH8bFg8wvtzZM+Ry6Y6cFnkmgg+ynHNhqtkV1Xx7z7/D41cA8l
         S0pZi161myfNfhsxgjZEpyrC21enkuseJLFcwn74Ajc6HYygbm4F+qONQIgEAxmFqKdI
         2kLqVAlphxwzRs9xYY/OEMw6l3G8Xew+PIOm5qx/vXlJQhfUaimvloRfFYHWbHnt3fgN
         fwf2dDsUScDr6VZN1yQGQG37KwQ+HdYc+MvU0hGyaPjyCKAPt8oOen53lHcTBF/DvIUd
         4XHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772693391; x=1773298191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SJnKoH2k8aUsMnHN9s6q8EPoGOgHGpVja0sh8tMg5Zs=;
        b=U2ljuj1IK4hQn10CkIksQIOKvEIelWRb/mnA1V3b2kW6sUZAdeGXeqM2jhRusggeY7
         /G/i/nstG3ilghL8bJp96r0kV+TutIxJsKB6nEFZPt3kfdL2WYPoSpsxv+cAXf4CqW/S
         T/scV9DTIbPDvywp994JfkVnxMPX6tSIb4/OTdit3xbu3uRWmfhq6xNx6dYdrL8fZ+7D
         +hTCTG1HIh1Q6Y9MSS4yUiUVCPIbvR1YoTRUu7eowaQMbRG2g8ZJODIlhVGymFBWtpS3
         zHsI1lY9YaxuBNKcanydx+uZzTbj3ENftSgYiNHR3nH59Cvu9srZpT/mtZe2obD/3s6p
         qfiA==
X-Forwarded-Encrypted: i=1; AJvYcCXngmTHHGiy/Oh0esb7MaezDiZ+TD5wkLSFaRc5L+7xuZsvaKZU1WiLmXkpqdITR1ZPPkc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/htPa8HC+wr2X7U+2q9sUpQbzJ5UQfU0SdVR43OsMFg1MPlVA
	2WczDc0WW3fBECaYewmbuFlgPIXkRy5IJTj73be91APwq5YaRwaeJjCt2B1U0EaA+wvemq/pROE
	Le48GYP16zosvh6Of/Vz0NG7xBYK19mc=
X-Gm-Gg: ATEYQzyXIaCd1tbAAk4uSjMwiAKS5gkuEI4qjQoC6eWlJfYAT/uXM3w+jojsxjvgBiQ
	/FKopeWDC99GNlqaZmPnCCWiaQmQT50KndMFnn+8Vo6KbWLseLZEDXRrhXsBOvH/F/6gm+4p19a
	MS16eAWu70WnQZm0dOPvK0ZhXxxzya7ExT2Bs543da25uBzSorUrKTW0v+v4c3yKmQAxiqqpyJQ
	Ed4RScuKy7VlvFTp120bpxeQ/LelIvoVSPJzVXLBwu5gekk81g8MrhCNWRdmD6NO1jaeoGUERGm
	vJLDWNR2b8vVI5WXjgf/IxLvPVGgr3O+ZTpNEQJmDiCOYkvC1ovrLUeuCajxHuhdGuhcfnUTXg7
	cVMsOamv0zeyWj+MCYkfBUg==
X-Received: by 2002:a05:7022:324:b0:127:3b1d:f593 with SMTP id
 a92af1059eb24-128b7086624mr1846052c88.9.1772693391456; Wed, 04 Mar 2026
 22:49:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com> <20260305-scmi-imx-reset-v1-1-18de78978ba9@nxp.com>
In-Reply-To: <20260305-scmi-imx-reset-v1-1-18de78978ba9@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 5 Mar 2026 08:52:41 +0200
X-Gm-Features: AaiRm505xBxL2PxE2YKJ3MTVjZe8kemHLRhSvtWvM-ybN_ZTK85FYION66BVMA4
Message-ID: <CAEnQRZC4w3qNOJgth=8N-Ri3wFeKc-=VnQXWzr4WR0j6yt7WMQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] firmware: arm_scmi: imx: Support getting reset reason
 of MISC protocol
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 3:55=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> MISC protocol supports getting reset reason per Logical Machine or
> System. Add the API for user to retrieve the information from System
> Manager.

[..]

> +struct scmi_imx_misc_reset_reason_in {
> +#define MISC_REASON_FLAG_SYSTEM        BIT(0)
> +       __le32 flags;
> +};
> +
> +struct scmi_imx_misc_reset_reason_out {
> +       /* Boot reason flags */
> +#define MISC_BOOT_FLAG_VLD             BIT(31)
> +#define MISC_BOOT_FLAG_ORG_VLD         BIT(28)
> +#define MISC_BOOT_FLAG_ORIGIN          GENMASK(27, 24)
> +#define MISC_BOOT_FLAG_O_SHIFT         24
> +#define MISC_BOOT_FLAG_ERR_VLD         BIT(23)
> +#define MISC_BOOT_FLAG_ERR_ID          GENMASK(22, 8)
> +#define MISC_BOOT_FLAG_E_SHIFT         8
> +#define MISC_BOOT_FLAG_REASON          GENMASK(7, 0)

I would move this macros outside of the struct. Although the intention
is good it makes everything hard to read.

Just do:

struct scmi_imx_misc_reset_reason_out {
__le32 b_flags; /* MISC_BOOT_FLAG_* flags */
__le32 s_flags; /* MISC_SHUTDOWN_FLAG_* flags */
      /* Array of extended info words */
       __le32 extinfo[MISC_EXT_INFO_LEN_MAX];
}

[...]

> +static int scmi_imx_misc_reset_reason(const struct scmi_protocol_handle =
*ph, bool system,
> +                                     struct scmi_imx_misc_reset_reason *=
boot_r,
> +                                     struct scmi_imx_misc_reset_reason *=
shut_r,
> +                                     u32 *extinfo)
> +{
> +       struct scmi_imx_misc_reset_reason_in *in;
> +       struct scmi_imx_misc_reset_reason_out *out;
> +       struct scmi_xfer *t;
> +       int ret;
> +
> +       ret =3D ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_RESET_REASON_GE=
T, sizeof(*in),
> +                                     sizeof(*out), &t);
> +       if (ret)
> +               return ret;
> +
> +       in =3D t->tx.buf;
> +       if (system)
> +               in->flags =3D le32_encode_bits(1, MISC_REASON_FLAG_SYSTEM=
);
> +       else
> +               in->flags =3D cpu_to_le32(0);

What does system =3D 0 mean? can you directly do in->flags =3D 0?


> +
> +       ret =3D ph->xops->do_xfer(ph, t);

Is it mandatory to call  ph->xops->xfer_put(ph, t); even if ret ! =3D 0?
Because we can get rid of one level of indentation with:

 ret =3D ph->xops->do_xfer(ph, t);
 if (ret)
    return ret;
