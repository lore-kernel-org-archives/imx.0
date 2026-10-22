Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792661840;
	b=bogyp4PxE1u4XO0r4p1HEs+oOgaOndC/uaKJ8So0BzNoOdqHCO5ig4MLi7Hm0oZDSKDc
	 g7jF+BAPVIyc9bGO0sPygcuBrUQcg58KxVC8Vs8YxQKK5iQDsXRphAFZG9lzzqzPQlpvr
	 X7TIDEXhUhLVKl/0nc50QfkO0kR4dTNHUKOhBt0SLagU1o2f/vm8C8zA5Oh+QTUSZEesF
	 9WHVLui5aqk2o0SxTiccsPE40+a/SsWwQFGHtB92FSNKBWUUslHEOjBpR/Ho0GJMiyHha
	 mMRYXA4RzlvXeGbsCM/3CK1QeAXDoCRxk10T3dBerfrsHFdTIpFtJQK4HnYdK4Wgtgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lFFS1+/t5gGgfabS/98lFLo3mEoArCKzDgJBr3YYbG0=;
	b=uVzRhVOTR/DgN8GC0E9YZxRAHVGjvjKLxmULS6GbD3OV/DCGN9CcPhlzF8zHQjq6kKGQ
	 FjFMb09H24gA9yISeKz582TfPgDR7tV6r0DNlPmFF10boToT4Mh41ksvjGxYlsgL0JJK5
	 FAAwt/ehgzTNXgCCQkM6/UvUwuoApq1j+BFDjp5tKFCj46ubSH3lTWWgyKCywUchK3TSA
	 98+5d/v1j7VdknDGu7hcNzExmEQPP1RyKkwgMUWbscAzxdjpfOZO24YEwJPQdHfv8EQ+1
	 1wQkQ1Dybme4xyMXa7T+zddiZkZ0tPmHK6kQlIphviD2dUAwMYr/wsoea1hmEgpw21Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EXusSZuc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CC3606A31E
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 09:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92CC3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EXusSZuc
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ccca948203aso510505a12.3
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 02:37:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792661839; cv=none;
        d=google.com; s=arc-20260327;
        b=hEZdLePw93/9mMh/qlTOhDOqW3EuyJ8maWX8Yu7qqCiUpbTcdJBtKlCnqfocVybwB4
         PPrq0jtLvd33G1UkJbzQIdP2MoNpkefDbi9xPOzz8O6OitEVypN+IyumFoV9ImJWyhZA
         +cKRVQ+fk0fM4vo7tV7Z3jayo/CMHaNXGs1zvHSU5y1cjnzkyvChE/vZuyAt8WnVFaCE
         E7hLRBh4Jx7SZDxahdf/16YfpaQjOVtDyfnZbXdlbQcZ/U6y2MeU27756csoWFN8XWsB
         sk9/XCLJeILsqkxUviu9gs6RtVkv+oZ6kb7TrJh7g09qxRj2X0ICG19m1tRB5NyV6V52
         58Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lFFS1+/t5gGgfabS/98lFLo3mEoArCKzDgJBr3YYbG0=;
        fh=xq+sActlFn2hemwGzaPHipohZbvnvtxoHlJ2qB+lnIw=;
        b=q3cpbvy4zFq6GSZ1pDBlXUxKMcBh0dAno4BwgtJak4Ol6U4op4pePJePPZIK258sM0
         dDEHbe11hOiWaX6VQAZRNUrSRIrKIoCWM74ljHKEFLI/nY6H2q/baiHtNr95AStR+u0n
         VRVo4CuETiR6krKjKqujL8MI+NNoCTq/AGOD4Os2nYan/fKMvxa3eR13wAvNcjGD+tUd
         GU4iuzmLbJnqYU35qOWgBTKn+p1weC6eObIITGca4j1NWvBrqbnoEYfjJ6vM1jviu4JW
         3weoH1rqqBlUqY43NzzE+gIxwJIcKC0CldPOxT2c1Ekjq41u/tKJU+LMAQ+M/qp5n91g
         UdAg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792661839; x=1793266639; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lFFS1+/t5gGgfabS/98lFLo3mEoArCKzDgJBr3YYbG0=;
        b=EXusSZuc7nNlFV9U7mY5XinvW4d8MVT89/Q1BfZzEAxicHL7D1To9Tw6rovkSROxbI
         wtBH+prqwtGR73SwuwyKah5GgpgAzBDt4fA7DcRUUGEo2SqhUq9oeFJ5s6bn9BC8ESTy
         CgsKjeMnCUzBgRbvijOJhyh326G6E7GNhp5gNHCrltL60lxAz0rwVyFJJBj6iypq4LxK
         WAy5GhTtW5qPUlpUBw5qM9v/985pvWUzbyv2XL0dGZoOsytEE4WN3UuJtW2kjDIV0A1u
         d4LChR5zdwQ0+ZdZEaTlXWo1kiv8eYM6sQKS5cO7qZaCFQ4QUthffbiFmSEM4nU2Wq86
         EdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661839; x=1793266639;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lFFS1+/t5gGgfabS/98lFLo3mEoArCKzDgJBr3YYbG0=;
        b=a/UWAgLGEPeN7xOoyAl69Yh1zivqK2I7ypjjyTUT70MsvTcFqOMnV5Ac70ykjxmusB
         rX88AqfrnCXtXrYDdD4fEpfiR45l3C52/BgnRIrTcf95qG1mvK+UQSg8uwq0slN51WWO
         sK1v50TeMXbeHuBfCfyrshABEeRIneXhRbJFeI/Q3X3QV1ikgzglT/+3MIHJZ7qzegDs
         HmQtGO6ruQG7k/OrkjB9y+9x9pXySULnG/1l77ybm8ivD0GDXkmnVduSMhozRFDbhMr9
         yK4WfDbUCMABiA99VB82TTu48OreRPbIDgU5hVex1Ar0tPORVbjL+8r5+v1AlLxlz3uZ
         V2cw==
X-Forwarded-Encrypted: i=1; AKwUvBxPXFeHCntMqYPkfNKqc8Sov7gS0GsOjkCAJfja94dqd79NseGWVByiybQdqyKeeuqHERk=@lists.linux.dev
X-Gm-Message-State: AFq9FYIjputQne5ckKDRcwRvprglzNYKNWxOpD8HKUYYTpXarBaii3xt
	s7aWq4fZJD53gpCt9xVLNhZKD8jUSVOyPAqoIjz6N6ChVXxHeg1Aflw4dkYy8BuFgUvwLNd9yUk
	JPH+E87pJKFkjdZCiuwsMqfsCNDwRqxjzhEyZNxXplw==
X-Gm-Gg: AYBFou077Tt7c+2rV5yAryg39fF3Z8rzAZs3dX3sQ1O0VDw/gSljKvyTA+Q4HzBqec7
	53o9UQeUxECZpQ/VjpQKpBCO5NTz+4PmImBj1Sbij7xts3o4XlCGZ5Ms9zeta/7nNIGhXFvzEQv
	8A/Reab/gEAmMOveloDXYp9kTm4fJfHlASGt2NWOxWWDtAoln8PTB+rY63SKKTcGygE2pE+YkRp
	xsEN2S8t7WZUkxvTH9bPmPnT5R85uoAzadNdqQM905OW8IPCfLzpn1xxMVrosyGpOp8xt6PprPt
	9sMn3J2nUgUipLa4G2AGbnMbrIn8RIQptuUe5d3Tb294GdEd4qm1pAqXa44C9n+U3UmpqBY4Xo7
	GBqy+ybHiZ1sZj4wDe4wj3njoXz8MBt62GpvcQw==
X-Received: by 2002:a05:6a20:c6cd:b0:3e1:3178:8d63 with SMTP id
 adf61e73a8af0-3e287e025e1mr3241635637.44.1792661838857; Thu, 22 Oct 2026
 02:37:18 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261019-b4-imx-pcm-rpmsg-concurrent-v1-1-c1fb8c33f4db@nxp.com>
In-Reply-To: <20261019-b4-imx-pcm-rpmsg-concurrent-v1-1-c1fb8c33f4db@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 22 Oct 2026 17:36:58 +0800
X-Gm-Features: AclHuK8v2lajakrSJ87vVRxpdMWjcEs90TbK_GuOR8gXyo3LH7ug2o5_RGKU8uI
Message-ID: <CAA+D8AMOW3oUoX7xJpuD=T4QJn0iDPfZqQuT1=1otZ1Dqh6otQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-pcm-rpmsg: Flush pending work in hw_free
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Chancel Liu <chancel.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 2:58=E2=80=AFPM Chancel Liu <chancel.liu@oss.nxp.co=
m> wrote:
>
> From: Chancel Liu <chancel.liu@nxp.com>
>
> imx_rpmsg_terminate_all() queues the TERMINATE message to the workqueue
> and returns, while the DAI hw_free() synchronously gates the audio
> clock. The two can then run concurrently, and this concurrent access to
> the shared audio clock path can cause a stop failure or even hang the
> system.
>
> Flush the workqueue in a new component hw_free(), which runs before the
> DAI hw_free(), so TERMINATE is fully handled before the clock is gated.
> CLOSE stays the last message.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
shengjiu Wang
> ---
>  sound/soc/fsl/imx-pcm-rpmsg.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.=
c
> index 85b7c929a28a..6a0174d6c78d 100644
> --- a/sound/soc/fsl/imx-pcm-rpmsg.c
> +++ b/sound/soc/fsl/imx-pcm-rpmsg.c
> @@ -178,6 +178,16 @@ static int imx_rpmsg_pcm_hw_params(struct snd_soc_co=
mponent *component,
>         return 0;
>  }
>
> +static int imx_rpmsg_pcm_hw_free(struct snd_soc_component *component,
> +                                struct snd_pcm_substream *substream)
> +{
> +       struct rpmsg_info *info =3D dev_get_drvdata(component->dev);
> +
> +       flush_workqueue(info->rpmsg_wq);
> +
> +       return 0;
> +}
> +
>  static snd_pcm_uframes_t imx_rpmsg_pcm_pointer(struct snd_soc_component =
*component,
>                                                struct snd_pcm_substream *=
substream)
>  {
> @@ -285,9 +295,6 @@ static int imx_rpmsg_pcm_close(struct snd_soc_compone=
nt *component,
>         struct rpmsg_info *info =3D dev_get_drvdata(component->dev);
>         struct rpmsg_msg *msg;
>
> -       /* Flush work in workqueue to make TX_CLOSE is the last message *=
/
> -       flush_workqueue(info->rpmsg_wq);
> -
>         if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
>                 msg =3D &info->msg[TX_CLOSE];
>                 msg->s_msg.header.cmd =3D TX_CLOSE;
> @@ -624,6 +631,7 @@ static const struct snd_soc_component_driver imx_rpms=
g_soc_component =3D {
>         .open           =3D imx_rpmsg_pcm_open,
>         .close          =3D imx_rpmsg_pcm_close,
>         .hw_params      =3D imx_rpmsg_pcm_hw_params,
> +       .hw_free        =3D imx_rpmsg_pcm_hw_free,
>         .trigger        =3D imx_rpmsg_pcm_trigger,
>         .pointer        =3D imx_rpmsg_pcm_pointer,
>         .ack            =3D imx_rpmsg_pcm_ack,
>
> ---
> base-commit: 8d00cfd77ffa64477129969eec8249c8cdadc9c2
> change-id: 20261019-b4-imx-pcm-rpmsg-concurrent-1522959ba768
>
> Best regards,
> --
> Chancel Liu <chancel.liu@nxp.com>
>
