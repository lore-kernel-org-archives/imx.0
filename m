Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BFC52940E
	for <imx@lists.linux.dev>; Thu, 24 Sep 2026 17:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790271297; cv=pass; b=YTITxiAw8cAptp1WJIeFGkeRwiP1rP2CRMXkrxU47CE14hiU4K0z/UT2+yv+pKaP//blGiSMHeoQ1f4JrggMcRYOFYRxlLWuaE0zJggYLSTKokUXtIzawEiM2t9ESGCysr6kd5xsB3QDIUZykotBmo1Z469dSwEykTr2+eACpeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790271297; c=relaxed/simple;
	bh=P7+az3yyBJchUR91Z1ziGlXJNmLdkAluzh6AwSulzz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iL+gpF6WDCtVEr+9wREAnjVlORF5gsKJYkDaWx+c4h+AN4WvsfK5BcrBmYIimkGe1zj5z4ns897+8MbJ9Mi9mD0iyST89LHT9Yje9wedbYtvAwgAjcf73F0zmNYTyFhK7LHdUxLdNw6DUC01dF1mD5t+IpgBt+grXrqX2icDxj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tc0lWN0x; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tc0lWN0x"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c6b4783778so94030b6e.0
        for <imx@lists.linux.dev>; Thu, 24 Sep 2026 10:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790271293; cv=none;
        d=google.com; s=arc-20260327;
        b=eDamNuQ+XBHF0aNQlKtvDPe5U7AXxFIovovgmMqs3NkcyDeJU7MiGOLJ5K7HCp85O3
         wE1Ovm/rlAEa4YlbIatHiWzVVqSIHEZfFwAwQ9RcOVr1rOAW7h5StgG3y9hpeXvUvW/r
         jkJ3BIEMnvGenmcowSzVxIoHfgGxxehsRD2CcpdwUrylzOQ050PE2jSfKkcbvSdEhXa9
         oxgf7/yjz59LFOuwHNx3EiCpsfYSmg84e1bZHCKt+QMnNyaD2OSKA4fMBECh4Vrwl5FF
         X6YmAr9yxseG1ygF4dGD4w2xkatGTc8Qx1uYbOKhrWB8bzoZQzosGLrxR8U4nmNMK+Hg
         +zEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/3LlUQJdHFv3q79AvrsTmGXMAeRGwjkC4yOozzaFl6k=;
        fh=MNqUedaVZQxw9wG+56WTYGNVHMPms1Owwxl0F5w+0IA=;
        b=sYtQshnnAmkHr+uo0X5irm1mWhdZTbe6n0Dv5GU9KQVUHSNn3cXFYJ4pm1vSfRno8g
         +y51ajWvQFgrsEFc1TBb1tXMGPR1Qt1NFC7ASa1H5yd8fIUVFiENDzqvR/JmG16lYe9c
         q9UpBFrzZ6bIo0+IHE8R9rHVSZCIAEcAPY/fWgWnayLeWzhAcp4nM32tM524iUEkDIAQ
         B4FQYEPTS4Mydci+4pY4lFsmbFvJgO3B++e06NRILpE4OnTecJZj/rLIr3v4APn5L6P6
         2CIwhLx2em04aohFrFz068/lIWK5A5A4+thNCf74rZPViJujymLu59SKR4h0MKcYVT97
         e+Zw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790271293; x=1790876093; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/3LlUQJdHFv3q79AvrsTmGXMAeRGwjkC4yOozzaFl6k=;
        b=tc0lWN0xJWYh0aZq9sNBFRKFMgFAgAZReXYMwkMInRz2TaQeX0Iot6TvVc+nyI5qzc
         Tr5WNyzEwvlUzPAyMor1di1LtGvtMnOcnyniDuwmgd3WqaWNt++x6W2MmqsKSlDI3FBu
         2WiZM42JEB58fKA31JKlSEyxFEEFW4UQPeHRWo0a0MuQfs2ATPS4IWLq8APnOsazKxL6
         tkH4NifLJpjsGX34ztpj7h8rAaFQKgoDyPhsn+UjQQzBjT38o/hd25csx8l+00B1v+9W
         hyEAfzlnLCdFKi177cgz9ITyK3wkQfhnBolM+wY1NlgPYsxdWMBX+wWhsxHBT7kvB54P
         xqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271293; x=1790876093;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/3LlUQJdHFv3q79AvrsTmGXMAeRGwjkC4yOozzaFl6k=;
        b=HXc9MSbm5DkLR31UdhtU7ZCcZkFvKKC/vSkJOJQjee3wAx58YQcXahrFdujcEj1J38
         At8TJgT8BWUmcOeLhOZNkZ1LABEkEknQZ7egV1w3yPeHvAEqVdwQ3hztTJVoqFmDi8cV
         hbzZspZkJT39M3WksBcUd44XP/zTVIjOWB3TYcTY4zQJ474J9/9IimAoxmphLBPeRGEA
         DegGXiHgHlhKkjrkuSwfnDXevVkX8AUm/XVDAeppcTj9dfriUh52JX6rLlQL6r7GT+kV
         qW50F9DK6SW+f4zDBVMTym3XNpw6eZgjrbRUWsfAzcajhMPtKnSznhqYa1fw/1wqtIVi
         rerw==
X-Forwarded-Encrypted: i=1; AKwUvBx2tjm4yKrVWbr6QLIUGQI7ygQJQlXX5GuSsjzUWpVgJxO9YBz7xLRprEnmHtJ7lYFTMe8=@lists.linux.dev
X-Gm-Message-State: AFuF++n34K2R2QcodfN8EwUD4xk4EHK9GRPjWswNY5Hi1ggcsMrtNHQj
	JCXZve+i5TttPNSVsNVKW7hDb9/czzG8lEo6Oox/AJwrmjhNUV6QCkb/YomyuGwx+MbPJAgylqT
	ohLMGYrDjc5AciRsS/+Auf+Yn4E0F7BzEF6s5dk3E
X-Gm-Gg: AYBFou1nzzEr7Z9iKTZbjNAnFjBLN4ZA1kx43Sbx0V3vURN/w4El38i5ZewMwYZfS48
	CE5Js8VfbDPhN/kgjVuAZftsRN8erSTK8vkRdpzWQ5tsPSUZR9VDW33hp349ZzKwjheELLmxvoK
	8ELHyWXk/sHbMdF59WGiaSLeG8bQqqsTfqFE+Ysu70O4U8JW8qn0H2E8HzsEjGYTTdt4fi/yy4J
	btnwTYeO51tokH3b4baUaz6aLxkB28ELGgpbUk6HyTw4R13JKqXAmvFkOMKoK8QoTpgyFjmNik2
	nPb5+KSWNajgUiPW3Sk1ihbapGQX6KJuxrzrAFM2UxzVH9jw00XsMTp8Wf5tI85SAe8N5doVi0x
	kpF4OF1Tj
X-Received: by 2002:a05:6808:16a8:b0:4c3:95d:91f1 with SMTP id
 5614622812f47-4d728c29fd9mr3339337b6e.1.1790271292781; Thu, 24 Sep 2026
 10:34:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916043957.3362995-1-xu.yang_2@oss.nxp.com> <arJdb9kip_YCzjV2@black.igk.intel.com>
In-Reply-To: <arJdb9kip_YCzjV2@black.igk.intel.com>
From: RD Babiera <rdbabiera@google.com>
Date: Thu, 24 Sep 2026 10:34:41 -0700
X-Gm-Features: AclHuK_fQ4a1sDCLA9MNnm5rNq9xegB11a5TSGfdfhcIWsSj0kYwqVQmb6LZFsg
Message-ID: <CALzBnUG78eno0Qbv0Hg0_LeqKq02Gmcsiwwee03ju6-OGhb4Fg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: tcpm: advance vdm_discovery_state on
 Discover Identity Not_Supported
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Xu Yang <xu.yang_2@oss.nxp.com>, badhri@google.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for tagging me here Heikki.

On Tue, Sep 22, 2026 at 3:50=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> +RD
>
> On Wed, Sep 16, 2026 at 12:39:57PM +0800, Xu Yang wrote:
> > From: Xu Yang <xu.yang_2@nxp.com>
> >
> > Commit Fixes: 205dc9cb39f5 ("usb: typec: tcpm: implement retry mechanis=
m
> > for Discover Identity VDMs") advances vdm_discovery_state to
> > VDM_DISCOVERY_COMPLETE when a CMDT_RSP_NAK is received, but it does not
> > advance the state when a non-modal port returns PD_CTRL_NOT_SUPP.
> >
> > This can re-arm another vdm_discovery_work if the port is going to
> > respond with PD_CTRL_NOT_SUPP to the partner.
> >
> >   tcpm_pd_handle_msg(port, PD_MSG_CTRL_NOT_SUPP, NONE_AMS);
> >     tcpm_queue_message();
> >       mod_tcpm_delayed_work();
> >         tcpm_state_machine_work()
> >           tcpm_send_queued_message()  -> send PD_MSG_CTRL_NOT_SUPP
> >           run_state_machine()
> >             case SRC_READY:
> >             case SNK_READY:
> >               mod_vdm_discovery_delayed_work(port, 0);
> >
> > If both the port and its partner do not support modal operation, they
> > will send DISCOVER_IDENTITY to each other infinitely.
> >
> > Advance vdm_discovery_state to VDM_DISCOVERY_COMPLETE in this path as
> > well. In particular, update the state to VDM_DISCOVERY_COMPLETE if it c=
omes
> > from the port partner, and to VDM_DISCOVERY_CABLE_IDENT if it comes fro=
m a
> > cable.
> >
> > Fixes: 205dc9cb39f5 ("usb: typec: tcpm: implement retry mechanism for D=
iscover Identity VDMs")
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: RD Babiera <rdbabiera@google.com>

> >
> > ---
> > Changes in v2:
> >  - cover a cable returns PD_CTRL_NOT_SUPP case reported by sashiko

PD Spec indicates that unsupported cable VDMs get ignored, but it is
very much valid to keep the filter in case a non-compliant cable returns
Not_Supported.

> >  - kick off vdm_discovery work to continue working
> >  - correct previous wrong fix commit id
> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcp=
m.c
> > index 2d6b14aa2085..5cea820e00c4 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -3891,6 +3891,16 @@ static void tcpm_pd_ctrl_request(struct tcpm_por=
t *port,
> >               case SRC_READY:
> >               case SNK_READY:
> >                       if (port->vdm_state > VDM_STATE_READY) {
> > +                             if (port->ams =3D=3D DISCOVER_IDENTITY) {
> > +                                     if (rx_sop_type =3D=3D TCPC_TX_SO=
P) {
> > +                                             tcpm_update_vdm_discovery=
_state(port,
> > +                                                             VDM_DISCO=
VERY_COMPLETE);
> > +                                     } else if (rx_sop_type =3D=3D TCP=
C_TX_SOP_PRIME) {
> > +                                             tcpm_update_vdm_discovery=
_state(port,
> > +                                                             VDM_DISCO=
VERY_CABLE_IDENT);
> > +                                             mod_vdm_discovery_delayed=
_work(port, 0);
> > +                                     }
> > +                             }
> >                               port->vdm_state =3D VDM_STATE_DONE;
> >                               if (tcpm_vdm_ams(port))
> >                                       tcpm_ams_finish(port);
> > --
> > 2.34.1
>
> --
> heikki

Best,
RD
