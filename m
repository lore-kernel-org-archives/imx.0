Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C110E1D6BB;
	Mon,  8 Jun 2026 04:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780891577; cv=none; b=e2ZbE7v5A1WEBQTkiJ/gEvfIc+s5GIlUAjI2kNq4YXmr1VLr3aa9VKMHVD6d9dEP9bwd0KbDO+HWKr8Va9TayaRR2zBabfNnwgQBtQSjSd9ynyqUCeqFrcJE6iwIZ8s9N0DxloEo4woXyTdr7nXJ2wQbI+wnZzOe1ci3Kib9JMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780891577; c=relaxed/simple;
	bh=F8/jQjTJQ3sQgVMgeIYjPza3tAsScQKHGr0/dOOmhP8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qTBJPY0qg5UrZkLmRYEovi9+sh01h99PPgQO+8aqw9x/awbyaBNJiq9cC6zOkMzf0mQMtqQbxJQTZ0kwlmOX9c32D23Anl7LRc6ttkZTIIKpVBSuO/St1S1oenJs7WBbdKNzWSFZ7bk68RmINuW6CzzUmQqINJGrj+Y06mEVx88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dW6ynNjH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dW6ynNjH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A3EE1F00893;
	Mon,  8 Jun 2026 04:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780891576;
	bh=qzlQzObR2C9pYhqt2bGzKeBsijRRFjsoarjGqiLJ+YM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dW6ynNjH7iRzpo7yi/0qe2ONqB3iuRTr5Q/ksIACO1/bFEXhlodsI4ZkUXfb23fGw
	 llLlgd+9EE1FctILbTM+iaue4EcP259goU5XmyVoEgh8zNUWC52hWWj2oF0mA0t4hS
	 NE70ND8/j5IVMhhWdEGqWlKlpijAIC0nypAF4jc3akwzpQoDStC3HXCXbH3eFVKtA9
	 g0k+ICwM9zFLprzYwA4DUZhes+t7X78aNbcA4hRKIMlvpgPEz8F7mscrJfwkOU++jh
	 sv+vbKn7NfnuxHC59V98GwmgORJIONOwqomvP0snhltTyz1lVPLydUnNuy3WPnSWMy
	 nAVokuIuNx/Lw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/2] media: docs: Clarify
 V4L2_FMT_FLAG_DYN_RESOLUTION usage
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ming Qian" <ming.qian@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260608-flag-dyn-resolution-v1-1-44dc65516148@oss.nxp.com>
References: <20260608-flag-dyn-resolution-v1-1-44dc65516148@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 04:06:15 +0000
Message-Id: <20260608040616.1A3EE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The added documentation conflates `V4L2_FMT_FLAG_DYN_RESOLUTION` (=
which designates mid-stream dynamic resolution switching capability) with t=
he mandatory initial `V4L2_EVENT_SOURCE_CHANGE` event. By stating "Clients =
can use this flag to determine whether the decoder will signal the initial =
resolution", it explicitly legitimizes a flawed userspace heuristic that vi=
olates the V4L2 stateful decoder specification. The specification mandates =
that for coded formats containing resolution info, the decoder MUST parse t=
he stream and emit an initial `V4L2_EVENT_SOURCE_CHANGE` event (Initializat=
ion Step 4). Compliant drivers (e.g., `coda`) correctly emit this initial e=
vent but do NOT set `V4L2_FMT_FLAG_DYN_RESOLUTION` because they lack mid-st=
ream switching capabilities. If userspace follows this documented advice, i=
t will erroneously skip waiting for the initial event on these drivers, bre=
aking Capture Setup and stream decoding.
--

commit ec9c0583334c246f7813132b55724e42622e8edd
Author: Ming Qian <ming.qian@oss.nxp.com>

media: docs: Clarify V4L2_FMT_FLAG_DYN_RESOLUTION usage

This commit updates the V4L2 stateful decoder documentation to clarify the
usage of the V4L2_FMT_FLAG_DYN_RESOLUTION flag. It adds a note stating that
decoders setting this flag will always emit an initial source change event.
The documentation suggests clients can use this flag to decide whether to
wait for the initial resolution signal.

> diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Docu=
mentation/userspace-api/media/v4l/dev-decoder.rst
> --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> @@ -361,6 +361,14 @@ Initialization
[ ... ]
> +    .. note::
> +
> +       Decoders that set the ``V4L2_FMT_FLAG_DYN_RESOLUTION`` flag for t=
he
> +       coded format will always emit an initial ``V4L2_EVENT_SOURCE_CHAN=
GE``
> +       event with ``V4L2_EVENT_SRC_CH_RESOLUTION`` during this phase. Cl=
ients
> +       can use this flag to determine whether the decoder will signal the
> +       initial resolution before producing decoded frames.

[Severity: High]
Does this guidance conflate the V4L2_FMT_FLAG_DYN_RESOLUTION flag, which
designates mid-stream dynamic resolution switching, with the mandatory
initial V4L2_EVENT_SOURCE_CHANGE event?

The V4L2 Stateful Decoder API requires an initial V4L2_EVENT_SOURCE_CHANGE
event during the Initialization phase for stream parsing, irrespective of
dynamic resolution support.=20

Compliant drivers like coda correctly emit this initial event but do not set
V4L2_FMT_FLAG_DYN_RESOLUTION because they lack mid-stream switching
capabilities.

If userspace follows this documented advice, wouldn't it erroneously skip
waiting for the initial event on these drivers, potentially breaking capture
setup and stream decoding?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-flag-dyn-r=
esolution-v1-0-44dc65516148@oss.nxp.com?part=3D1
